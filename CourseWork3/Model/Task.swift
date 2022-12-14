//
//  Task.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 13.12.2022.
//

enum Permission: String {
    case privateTask = "private"
    case publicTask = "public"
}

struct Task {
    var name: String
    var description: String
    var deadline: String
    var groups: [String]
    var permission: Permission
    var owner: User
}

extension Task {
    init() {
        name = "Разработать дизайн курсового проекта для приложения - тасктрекера"
        description = "Подготовить макеты в фигме для индивидуального/командного мини-проекта по созданию мобильного приложения по курсу. Необходимо сформулировать перечень функциональных требований к программе, построить use-case-диаграмму с покрытием прецедентами всех этих требований. Продумать все возможные сценарии использования и отразить их в виде вайрфреймов с проработанными макетами экранов приложения."
        deadline = "3 Dec, 2022"
        groups = ["Курсовая работа", "Диплом", "Организация вечеринки", "Работа"]
        permission = Permission.privateTask
        owner = User()
    }
}
