---
title: Swift学习-面向协议编程中associatedtype的认识
date: 2017-04-19 16:28:13
categories:
    - iOS
tags: 
    - Swift
    - iOS
---
>https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Generics.html

在定义协议时，有时将一个或多个关联类型声明为协议定义的一部分是有用的。一个相关联的类型给出了一个占位符名称到被用作协议的一部分的类型。在采用协议之前，不会指定用于该关联类型的实际类型。关联类型用`associatedtype`关键字指定。

这里是一个叫做协议的例子`Container`，它声明一个关联的类型`Item`：

```
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
```

该`Container`协议定义了三种所需的功能，任何容器必须提供：

* 必须使用`append(_:)`方法向容器添加一个新项目。
* 必须可以通过`count`返回`Int`值的属性访问容器中的项目计数。
* 必须可以使用具有`Int`索引值的下标来检索容器中的每个项目。

该协议不指定应该如何存储容器中的项目或者允许的类型。该协议仅指定任何类型必须提供的功能的三位，以便被认为是`Container`。只要满足这三个要求，一致的类型可以提供附加的功能。

符合`Container`协议的任何类型必须能够指定其存储的值的类型。具体来说，它必须确保仅将正确类型的项目添加到容器中，并且必须清楚其下标返回的项目的类型。

要定义这些要求，`Container`协议需要一种方法来引用容器将要容纳的元素的类型，而不需要知道特定容器的类型。该`Container`协议需要指定传递给任何值`append(_:)`方法必须具有相同的类型容器的元件的类型，以及通过所述容器的下标所返回的值将是相同的类型容器的元件的类型。

为了实现这一点，该`Container`协议声明称为关联的类型`Item`，写为`associatedtype Item` 该协议没有定义什么`Item`是 - 为任何符合类型提供的信息。尽管如此，`Item`别名提供了一种方法来引用a中的项目的类型`Container`，并定义与`append(_:)`方法和下标一起使用的类型，以确保`Container`强制执行any的预期行为。

这是一个非常`IntStack`类型的版本，适用于符合`Container`协议：

```
struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
```

该`IntStack`类型实现了`Container`协议的所有三个要求，并且在每种情况下都包含了`IntStack`类型现有功能的一部分以满足这些要求。

此外，`IntStack`规定了对于这种实现`Container`，适合`Item`使用的是一种`Int`。将该`typealias Item = Int`抽象类型的定义`Item`转化为具体类型`Int`的该`Container`协议的实现。

感谢Swift的类型推断，实际上并不需要声明具体`Item`的`Int`定义`IntStack`。由于`IntStack`符合`Container`协议的所有要求，所以Swift可以`Item`通过查看`append(_:)`方法参数的`item`类型和下标的返回类型来推断适用的方法。实际上，如果你`typealias Item = Int`从上面的代码中删除一行，那么所有内容都仍然有效，因为它应该是什么类型的`Item`。

你也可以使通用`Stack`类型符合`Container`协议：

```
struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
```

此时，`type`参数`Element`用作`append(_:)`方法参数的`item`类型和下标的返回类型。因此，Swift可以推断出这`Element`是特定容器使用的适当类型`Item`。

扩展现有类型以指定关联类型

你可以扩展现有类型以添加​​符合协议，如添加协议与扩展一致性所述。这包括具有关联类型的协议。

Swift的`Array`类型已经提供了一个`append(_:)`方法，一个`count`属性和一个带`Int`索引的下标来检索它的元素。这三个功能符合`Container`协议的要求。这意味着你可以通过声明采用协议来扩展`Array`以符合协议。你可以使用空的扩展名来执行此操作，如使用扩展名声明协议采用所述： ContainerArray

```
extension Array: Container {}
```

Array的现有`append(_:)`方法和下标使Swift能够推断`Item`适用于的`Stack`类型，就像上面的泛型一样。定义此扩展名后，你可以使用任何`Array`作为`Container`。

