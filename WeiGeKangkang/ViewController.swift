//
//  ViewController.swift
//  WeiGeKangkang
//
//  Created by black on 2021/10/15.
//

import UIKit
import SnapKit
let width = UIScreen.main.bounds.width
class ViewController: UIViewController {

    private var readV: ReadView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .black
        
        let scrollV = UIScrollView()
        scrollV.backgroundColor = .green
        view.addSubview(scrollV)
        scrollV.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
                
        let v = ReadView()
        scrollV.addSubview(v)
        v.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        readV = v
        
        let bt = UIButton()
        bt.backgroundColor = .red
        bt.addTarget(self, action: #selector(handleChangeFont), for: .touchUpInside)
        view.addSubview(bt)
        bt.frame = .init(x: 20, y: 49, width: 30, height: 30)
    }

    @objc private func handleChangeFont() {
//        readV.fontSize += 1
    }
    
}


