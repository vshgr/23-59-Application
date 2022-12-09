//
//  MainTasksPageController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class MainTasksPageController: UIViewController, UIScrollViewDelegate {
    private let name = UILabel()
    private let profilePic = UIImageView(image: UIImage(named: "rabbit"))
    private let taskTitle = UILabel()
    private let filter = UIButton()
    private let scroll = UIScrollView()
    private let tasksSV = UIStackView()
    private let tskFilerSV = UIStackView()
    private let profileSV = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
    private func setupView() {
        for view in [profileSV, tskFilerSV, scroll] {
            self.view.addSubview(view)
        }
        
        view.backgroundColor = .white
        setupName()
        setupImage()
        setupProfileSV()
        setupTaskLabel()
        setupTaskSV()
        setupTasksSV()
        setupScroll()
        setupConstaints()
        
        
    }
    
    private func setupName() {
        name.text = "Yana Barbashina"
        name.font = UIFont.dl.ralewayBold(20)
        name.numberOfLines = 0
        name.textColor = .black
    }
    
    private func setupImage() {
        profilePic.setWidth(75)
        profilePic.pinHeight(to: profilePic.widthAnchor)
    }
    
    private func setupProfileSV(){
        profileSV.addArrangedSubview(name)
        profileSV.addArrangedSubview(profilePic)
        profileSV.axis = .horizontal
        profileSV.spacing = 25
    }
    
    private func setupConstaints() {
        profileSV.pinTop(to: view.safeAreaLayoutGuide.topAnchor,15)
        profileSV.pinHorizontal(to: view, Grid.stripe)
        
        tskFilerSV.pinTop(to: profileSV.bottomAnchor, 17)
        tskFilerSV.pinLeft(to: view, Grid.stripe)
        
        scroll.pinTop(to: tskFilerSV.bottomAnchor, 25)
        scroll.pinHorizontal(to: view, Grid.stripe)
        scroll.pinBottom(to: view.bottomAnchor, 100)
    }
    
    private func setupTaskLabel() {
        taskTitle.text = "tasks"
        taskTitle.textColor = .black
        taskTitle.font = UIFont.dl.ralewayBold(20)
        filter.setImage(UIImage(named: "filter"), for: .normal)
        filter.addTarget(self, action: #selector(filterTapped), for: .touchUpInside)
    }
    
    private func setupTaskSV() {
        for view in [taskTitle, filter] {
            tskFilerSV.addArrangedSubview(view)
        }
        
        tskFilerSV.axis = .horizontal
        tskFilerSV.spacing = 15
    }
    
    private func getTask() -> TaskComponent {
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(taskTapped))
        gesture.numberOfTapsRequired = 1
        
        let taskView = TaskComponent(isSelfTask: false)
        taskView.isUserInteractionEnabled = true
        taskView.addGestureRecognizer(gesture)
        return taskView
    }
    
    private func setupTasksSV() {
        for view in [getTask(), getTask( ), getTask(), getTask(), getTask()] {
            tasksSV.addArrangedSubview(view)
        }
        
        tasksSV.spacing = 25
        tasksSV.axis = .vertical
    }
    
    private func setupScroll() {
        scroll.addSubview(tasksSV)
        tasksSV.pin(to: scroll)
        scroll.clipsToBounds = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.delegate = self
    }
    
    @objc
    func filterTapped() {
        let filterController = FilterPageController()
        self.navigationController?.pushViewController(filterController, animated: true)
    }
    
    @objc
    private func taskTapped(sender: TaskComponent) {
        print("hello blyat")
        let taskPageController = TaskPageController()
        self.navigationController?.pushViewController(taskPageController, animated: true)
    }
}
