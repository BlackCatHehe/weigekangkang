//
//  ReadView.swift
//  TestDemo
//
//  Created by black on 2021/10/14.
//

import UIKit
class ReadView: UIView {
    
    override var intrinsicContentSize: CGSize {
        return .init(width: width, height: size.height)
    }
    
    var size: CGSize  {
        return content.calculateSize(maxSize: .init(width: width, height: CGFloat.greatestFiniteMagnitude), attributes: attributes)
    }
    
    var attributes: [NSAttributedString.Key : Any] {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let dic: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont .systemFont(ofSize: 25),
            .paragraphStyle: style
        ]
        return dic
    }

    override func draw(_ rect: CGRect) {
        
        UIColor.white.setFill()
        UIRectFill(rect)
        
        
        let string = NSAttributedString(string: content, attributes: attributes)
        let frameSetter = CTFramesetterCreateWithAttributedString(string)
        
        let path = CGPath(rect: .init(origin: .zero, size: intrinsicContentSize), transform: nil)
        let frameRef = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
        
        
        let frame = CTFrameGetVisibleStringRange(frameRef)
        print((content as NSString).substring(with: .init(location: frame.location, length: frame.length)))
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0, y: intrinsicContentSize.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef, ctx)
    }
    
}


extension String {
    func calculateSize(maxSize: CGSize, attributes: [NSAttributedString.Key : Any]) -> CGSize {
        return (self as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
    }
}


let content =
"""
九战九胜，前面几场是凭借自己的本事，哪怕是被针对，也一一战胜对手，后面的几场，就是灵犀鹿妖王暗中的扶助了。
而灵犀鹿妖王那边已经明确向他们表示了，第十场比赛，他们将要面对的对手，就算是灵犀鹿妖王也不能有所倾向。出现人类团体要冲击十连胜这种情况，已经惊动了大斗兽场总部，也就是来自于祖庭的总部，这第十场比赛进行之前，将必须要向总部报备，有专门的总部人员前来监督比赛，以确保没有任何的徇私舞弊情况出现。所以，第十场是绝对公平的战斗。唯一能够透露给他们的，就是第十场比赛的对手是谁。
毫无疑问，这对史莱克战队绝不是一个容易战胜的对手。灵犀鹿妖王甚至暗中转告他们，希望他们不要参加这场比赛了，因为获胜的概率太低。如果想要去祖庭的话，灵犀鹿妖王可以为他们想其他办法，譬如乔装改扮成妖怪族。通关的东西灵犀鹿妖王可以帮他们来准备。
但这个提议被史莱克战队拒绝了。。
乔装改扮固然可以进入祖庭，但能参加拍卖会吗？这其中不方便的地方太多了。而且一旦被发现，那可就是必死的局面。祖庭是什么地方？那可是生活着众多大妖皇的世界，只要被刻意的注意到，任何的装扮哪可能瞒得过顶级强者。唐三他们又不是去旅游的，而是去攫取资源的，所以，必须要以最正规的身份前往，才能获得他们想要的东西。
所以，第十场比赛势在必行，只不过，史莱克战队并没有确定这个时间，他们需要更多的准备才行。
黄金山谷。
黄金树散发出的生命气息越发的浓郁了，它每天都在茁壮成长，从最初的几根枯木，现在已经生长到了足有五米多高，不大的树冠郁郁葱葱，生命气息每天都在增强。这固然是聚灵阵的作用，而和它本身也有着很大的关系。
黄金树自身的生命力越强，对于外界的大自然之力召唤效果也就越强，法阵只是放大了对灵力的聚集，而吸收还是要依靠它这个阵眼来完成才行。
而嘉里山脉虽然不是那种最富饶的山脉，但那要看和什么地方比。嘉里山脉内的生命力对比唐三前世所在的斗罗大陆上生命力最强的星斗大森林都不遑多让。而在嘉里山脉内又没有太多强大的妖兽来吸收这些天地灵气。广袤的山脉之中，浓郁的天地灵气近乎无穷无尽，这也是黄金树进化的根本所在。
通过不断的吞噬、吸收、进化，黄金树的成长已经走入了正轨。后面就要看它成长的时间了。
黄金树下，史莱克战队的五人，以及红狐少女们都在各自修炼。徜徉在这浓郁的生命气息中，对于他们的整体生命层次都在持续的提升着。从而弥补着人类妖神变血脉不纯的缺陷。
虽然对于史莱克战队来说，想要再有质变短时间内是不可能做到的，但每修炼一天，他们也依旧都能感受到自身的进步。
已经六阶，拥有三尾天狐之身的读白最近可以说是无欲无求。在唐三到来之前的他，甚至对于天狐变三阶都有种不可及的感觉，而现在的他，却已经是六阶了。他还年轻啊！他到现在，也就还不到十六岁。这么小的年纪就拥有三尾天狐之身，这在天狐族之中恐怕都已经是天才才能做到的事情了。
至于未来是不是能够提升到更高的层次，现在读白都有些并不奢望。六阶的天狐变在救赎组织之中都绝对是会被相当重视的存在。而追求更高的层次他自己不奢望，但他却相信他的小唐啊！他现在对唐三的依赖变得越来越强。或许也是因为天狐变的修为加深，让他能够越来越感受到唐三才是增加自己气运最重要的存在。只要跟随着他，自己的修为境界就能一直成长下去。前面这几次的飞跃不都已经证明了这些吗？所以，在史莱克战队之中，对唐三最有信心的，始终都是他。
武冰纪重修回到了八阶之后，修炼的越发刻苦了。几次生死危机的拼搏，让他无论是实战还是对于自身的修炼，都有了全新的认知。冰精变在他身上，已经修炼出了另一种层次，对于冰元素的感悟变得越来越强，已经是真正的开始抓住冰元素的奥义了。
现在的大师兄，对于神级层次已经真正存在了窥探的信心。而不像是以前那样想都不敢想。
程子橙的进步同样很大，自从那次折翼之后，她就发现了自己的问题所在。人类的身体，金鹏变的血脉，最大的问题就是自己的身体不够强韧，而不够强韧的身体就无法将血脉之力真正的发挥出来。
所以，最近她的修炼就一直都在淬体方向努力，不追求早日突破八阶，而是在七阶层次尽可能的稳固自己的修为，同时提升体魄。
黄金树带来的生命能量，黄金山谷内的天材地宝，足够她修炼使用了。对此，唐三还专门给她定制了个配方。用什么天材地宝浸泡身体，吃什么，怎么锻体，怎么修炼。在这方面，唐三也是有着充分的经验。
别看程子橙最近在修为境界上没有提升太多，但她现在却明显感觉到自己的身体脱胎换骨了一般，比之前坚韧了许多，强韧的身体，让她那第二层级的血脉之力也渐渐更好的与身体融会贯通，真正意义上的开始掌控金鹏变。
而和她相反的是，故里在最近修炼的过程中更多的是强调精神层面的修炼。服用最多的也是提升精神力的天材地宝。
突破到了七阶，他对于时间的掌控比以前更加精准，控制范围、控制效果都大幅度的提升了。而在这个控制过程中，就更需要强大的精神力作为后盾。而且唐三也明确告诉他，未来还想继续往上走，那么，他的精神力就要尽早达到九阶巅峰，神级以下的最高层次，这样才能有效的刺激他自身的血脉之力，让时光变前进的速度更快。同时，也要开始真正的去感悟时间的奥义了，这所有的一切，都是要以提升精神里作为基础的。
通过不断的实战，再加上唐三的指引，史莱克战队提升的速度可以用一日千里来形容。
黄金山谷不同于救赎学院，在救赎学院内还有其他的老师和学生，唐三也不方便特别密切的去指点他们。而这里不一样，张浩轩现在每天都在忙着去感悟传送大阵的奥妙呢，就算来黄金山谷，也在这方面下功夫，他更不会干涉唐三什么。这里更有着充沛的资源。
"""
