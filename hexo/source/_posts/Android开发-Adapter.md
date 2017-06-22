---
title: Android开发-Adapter和AdapterView.
date: 2017-06-05 14:12:43
categories:
    - Android
tags:
---

![](http://om9s615i9.bkt.clouddn.com/Adapter流程图.png-rambolu)

### Adapter
* Adapter从字面意思了解就是适配器，类似于iOS中UITableView和UICollectionView中的数据源。
  
　对于列表和九宫格控件，安卓也有类似iOS的ListView和GridView。
　　　
　由于ListView和GridView都继承于抽象类AbsListView，这个类中有一个`setAdapter`的方法，通过这个方法可以设置具体需要展示的数据。

```
以listView为例:
listView.setAdapter(otherAdapter);
```

　与iOS中遵守数据源协议，实现数据源方法类似。

　不过在iOS中对于列表和九宫格控件有着各自的数据源协议和函数，而安卓平台上把这个进行了解耦，通过对象的形式一个Adapter可以添加到多个控件，控件则进行样式的展示而已。
　
##### ArrayAdapter

* 官方提供了基于`BaseAdapter`的`ArrayAdapter`，`ArrayAdapter`可以看出采用泛型操作（数组、集合等），文档也说明，在默认情况下提供单个TextView操作，所以如果出现单个文本的情况还是可以采用的。
* 源码已经看出提供单个TextView进行赋值。

```
private @NonNull View createViewFromResource(@NonNull LayoutInflater inflater, int position,
            @Nullable View convertView, @NonNull ViewGroup parent, int resource) {
        final View view;
        final TextView text;

        if (convertView == null) {
            view = inflater.inflate(resource, parent, false);
        } else {
            view = convertView;
        }

        try {
            if (mFieldId == 0) {
                //  If no custom field is assigned, assume the whole resource is a TextView
                text = (TextView) view;
            } else {
                //  Otherwise, find the TextView field within the layout
                text = (TextView) view.findViewById(mFieldId);

                if (text == null) {
                    throw new RuntimeException("Failed to find view with ID "
                            + mContext.getResources().getResourceName(mFieldId)
                            + " in item layout");
                }
            }
        } catch (ClassCastException e) {
            Log.e("ArrayAdapter", "You must supply a resource ID for a TextView");
            throw new IllegalStateException(
                    "ArrayAdapter requires the resource ID to be a TextView", e);
        }

        final T item = getItem(position);
        if (item instanceof CharSequence) {
            text.setText((CharSequence) item);
        } else {
            text.setText(item.toString());
        }

        return view;
}
```

* Layout样式：

`simple_list_item_1` 纯文本

`simple_expandable_list_item_1` 纯文本“膨胀”版

`simple_list_item_checked` 文本后加对号选项

`simple_list_item_single_choice` 文本后加圆形选项
 
`simple_list_item_multiple_choice` 文本后加方块选项
等

* 代码实现：
 
```
strArr = new ArrayList<>();
for (int i = 1; i <= listNum; i++) {
    strArr.add("测试"+i);
}

// 纯文字列表
// arrayAdapter = new ArrayAdapter(this,android.R.layout.simple_list_item_1,strArr);
// 纯文字列表（加高）
// arrayAdapter = new ArrayAdapter(this,android.R.layout.simple_expandable_list_item_1,strArr);
// 加一个对号选项
// arrayAdapter = new ArrayAdapter(this,android.R.layout.simple_list_item_checked,strArr);
// 加一个原点选项
//arrayAdapter = new ArrayAdapter(this,android.R.layout.simple_list_item_single_choice,strArr);
// 加一个方块选项
arrayAdapter = new ArrayAdapter(this,android.R.layout.simple_list_item_multiple_choice,strArr);
listView = (ListView)findViewById(R.id.arrayAdapterListView);
listView.setAdapter(arrayAdapter);
listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        Log.d(TAG, "你点击了第" + position + "项");
    }
});
```

##### SimpleAdapter

* `SimpleAdapter`也是基于`BaseAdapter`的，相比`ArrayAdapter`增加了ImageView，同时layout样式是可以自己设定的，如果只是简单的图片和文字可以使用`SimpleAdapter`。

* 之前在思考为什么只有文字和图片，通过源码可以看出，再给每个item赋值的时候分别判断TextView和ImageView的实例存在。

```
private void bindView(int position, View view) {
        final Map dataSet = mData.get(position);
        if (dataSet == null) {
            return;
        }

        final ViewBinder binder = mViewBinder;
        final String[] from = mFrom;
        final int[] to = mTo;
        final int count = to.length;

        for (int i = 0; i < count; i++) {
            final View v = view.findViewById(to[i]);
            if (v != null) {
                final Object data = dataSet.get(from[i]);
                String text = data == null ? "" : data.toString();
                if (text == null) {
                    text = "";
                }

                boolean bound = false;
                if (binder != null) {
                    bound = binder.setViewValue(v, data, text);
                }

                if (!bound) {
                    if (v instanceof Checkable) {
                        if (data instanceof Boolean) {
                            ((Checkable) v).setChecked((Boolean) data);
                        } else if (v instanceof TextView) {
                            // Note: keep the instanceof TextView check at the bottom of these
                            // ifs since a lot of views are TextViews (e.g. CheckBoxes).
                            setViewText((TextView) v, text);
                        } else {
                            throw new IllegalStateException(v.getClass().getName() +
                                    " should be bound to a Boolean, not a " +
                                    (data == null ? "<unknown type>" : data.getClass()));
                        }
                    } else if (v instanceof TextView) {
                        // Note: keep the instanceof TextView check at the bottom of these
                        // ifs since a lot of views are TextViews (e.g. CheckBoxes).
                        setViewText((TextView) v, text);
                    } else if (v instanceof ImageView) {
                        if (data instanceof Integer) {
                            setViewImage((ImageView) v, (Integer) data);                            
                        } else {
                            setViewImage((ImageView) v, text);
                        }
                    } else {
                        throw new IllegalStateException(v.getClass().getName() + " is not a " +
                                " view that can be bounds by this SimpleAdapter");
                }
            }
        }
    }
}
```

* 判断实例完再给文本和图片设置值。

```
public void setViewText(TextView v, String text) {
        v.setText(text);
}

public void setViewImage(ImageView v, int value) {
        v.setImageResource(value);
}
```

* 代码：

```
 List<Map<String,Object>> listItems = new ArrayList<>();
for (int i = 0; i < icons.length; i++) {
     Map<String,Object> item = new HashMap<>();
     item.put("icon",icons[i]);
     item.put("name",names[i]);
     item.put("subName",subNames[i]);
     item.put("subIcon",icons[i]);
     item.put("subNames2",subNames2[i]);
     listItems.add(item);
}
simpleAdapter = new SimpleAdapter(
                this,
                listItems,
                R.layout.layout_item,
                new String[]{"icon","name","subName","subIcon","subNames2"},
                new int[]{R.id.imageView, R.id.textView, R.id.textView2, R.id.imageView2, R.id.textView3});
listView = (ListView)findViewById(R.id.simpleAdapterListView);
listView.setAdapter(simpleAdapter);
listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
     @Override
     public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        Toast.makeText(getApplicationContext(),"你点击了第" + position + "项",Toast.LENGTH_SHORT).show();
     }
});
```

* layout: 通过ConstraintLayout来进行布局。

```
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <ImageView
        android:id="@+id/imageView"
        android:layout_width="50dp"
        android:layout_height="50dp"
        android:layout_marginTop="10dp"
        android:layout_marginLeft="10dp"
        android:layout_marginBottom="10dp"
        app:srcCompat="@color/colorAccent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintBottom_toBottomOf="parent"
        android:layout_marginStart="10dp" />

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="TextView"
        android:textSize="20sp"
        app:layout_constraintTop_toTopOf="@+id/imageView"
        app:layout_constraintLeft_toRightOf="@+id/imageView"
        android:layout_marginLeft="10dp"
        android:layout_marginStart="10dp" />

    <TextView
        android:id="@+id/textView2"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="TextView"
        android:textSize="14sp"
        app:layout_constraintLeft_toLeftOf="@+id/textView"
        app:layout_constraintTop_toBottomOf="@+id/textView"
        android:layout_marginTop="5dp" />

    <ImageView
        android:id="@+id/imageView2"
        android:layout_width="10dp"
        android:layout_height="10dp"
        android:layout_marginRight="10dp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:srcCompat="@color/colorAccent" />

    <TextView
        android:id="@+id/textView3"
        android:layout_width="58dp"
        android:layout_height="17dp"
        android:text="TextView"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintRight_toLeftOf="@+id/imageView2"
        android:layout_marginRight="0dp" />

</android.support.constraint.ConstraintLayout>
```
##### BaseAdapter

* 通过Adapter继承结构图可以看到，Adapter为一个抽象接口,基于这个抽象接口的有一个抽象实现类`BaseAdapter`.

* 对于`BaseAdapter`，在实际开发过程中，大多数都会继承这个类，并重写其方法，定制自己的Adapter，其高度的解耦性，这点和iOS有所不同。

* 听开发的哥们说,相对来讲`SimpleAdapter`和`ArrayAdapter`用的少，都是自己重写或者使用第三方Adapter。

源码：https://github.com/RamboLouis/AndroidTestProject/tree/master/AndroidAdapter

