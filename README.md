# RuntimeUseCases
Runtime的一些使用案例和场景.

### 前话
这段时间继续学习了下Runtime.在网上找到了两篇比较好的文章.比起其他的概念性的非常强的概念性的描述,非常适合初学者入门.由此我也觉得,遇到陌生的知识,我们先用,有个大体印象之后,然后再研究对应的底层原理,直接啃底层,不是十分明智的想法.
##第一部分 -《OC最实用的runtime总结，面试、工作你看我就足够了!》

###代码
上边的代码范例,主要是是从《[OC最实用的runtime总结，面试、工作你看我就足够了！](https://github.com/XHTeng/XHRuntimeDemo)》的代码做了一个具体的抽取,方便吧大家学习和查看.作者原标题的有点浮夸,但是内容确实写的很好!

- `Runtime_ClassMethodAndImplementationsMethodDeals` - 获取类方法和实例方法,并且交换方法
- `Runtime_ReplaceSystemMethod` - 拦截系统方法,并且替换
- `Runtime_CategoryAddAttribute` - 给分类增加属性
- `Runtime_NSCoding` - Runtime归档解档方法,不必一个一个添加属性
- `Runtime_MJExtensionBase` - 字典转模型(MJExtension的基础原理)

###基础方法说明
>
>- 获得某个类的类方法
>`Method class_getClassMethod(Class cls , SEL name)`
>
>- 获得某个类的实例对象方法
>`Method class_getInstanceMethod(Class cls , SEL name)`

>- 交换两个方法的实现
>`void method_exchangeImplementations(Method m1 , Method m2)`
>
>- 获得某个类的所有成员变量（outCount 会返回成员变量的总数） 参数： 1、哪个类 2、放一个接收值的地址，用来存放属性的个数 3、返回值：存放所有获取到的属性，通过下面两个方法可以调出名字和类型
>`Ivar *class_copyIvarList(Class cls , unsigned int *outCount)`
>
>- 获得成员变量的名字
>`const char *ivar_getName(Ivar v)`
>
>- 获得成员变量的类型
>`const char *ivar_getTypeEndcoding(Ivar v)`

**`更加具体的实现过程,还需要我们自己点开文章跟着作者亲自来一遍.`**
##第二部分


