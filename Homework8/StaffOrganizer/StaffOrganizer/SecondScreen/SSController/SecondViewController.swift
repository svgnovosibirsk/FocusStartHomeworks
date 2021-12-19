//
//  SecondViewController.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 17.12.2021.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    // MARK: - Properties
    private var secondView: ISecondView?
    private var staffModel: IStaffModel?
    
    let context: NSManagedObjectContext?
    
    var selectedCompany: Company? {
        didSet {
            self.loadEmploees()
        }
    }
    
    // MARK: - Initialization
    init() {
        self.secondView = SecondView(frame: UIScreen.main.bounds)
        self.staffModel = StaffModel.shared
        context = staffModel?.persistentContainer.viewContext
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.secondView?.loadView(controller: self)
        self.setRightBarButtonItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Emploees"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.secondView?.configView()
        self.secondView?.backgroundColor = .white
        if let secondView = secondView {
            self.view.addSubview(secondView)
        }
    }
}

// MARK: - ISecondViewController Methods
extension SecondViewController: ISecondViewController {
    func getEmploees() -> [Employee] {
        self.staffModel?.getEmploees() ?? [Employee]()
    }
    
    func deleteEmploee(at index: Int) {
        if let employee = staffModel?.getEmploees()[index] {
            context!.delete(employee) // delete "!"
            staffModel?.deleteEmploee(at: index)
            saveEmploees()
        }
    }
    
    func editEmploee(at index: Int = 0, isEditMode: Bool = false) {
        
        var nameTextField = UITextField()
        var ageTextField = UITextField()
        var experienceTextField = UITextField()
        
        let employee: Employee?
        if isEditMode {
            employee = self.staffModel?.getEmploees()[index]
        } else {
            employee = Employee(context: self.context!) // delete "!"
        }
        
        let alertController = UIAlertController(title: isEditMode ? "Edit employee" : "Add new employee",
                                                message: nil,
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: isEditMode ? "Edit" : "Add",
                                        style: .default) {[weak self] action in
            if let text = nameTextField.text, let age = ageTextField.text {
                guard !text.isEmpty else { return }
                employee?.name = text
                
                if let itn32Age = Int32(age) {
                    employee?.age = itn32Age
                }
                
                if let expText = experienceTextField.text {
                    if let exp = Int32(expText) {
                        employee?.experience = exp
                    }
                }
                
                employee?.company = self?.selectedCompany
                
                if !isEditMode {
                    self?.staffModel?.addEmploees(with: employee ?? Employee())
                }
                
                self?.saveEmploees()
            }
        }
        
        alertController.addTextField { alertTextField in
            if isEditMode {
                alertTextField.text = employee?.name
            } else {
                alertTextField.placeholder = "Name"
            }
            nameTextField = alertTextField
        }
        
        alertController.addTextField { alertTextField in
            if isEditMode {
                if let age = employee?.age {
                    alertTextField.text = String(age)
                }
            } else {
                alertTextField.placeholder = "Age"
            }
            ageTextField = alertTextField
        }
        
        alertController.addTextField { alertTextField in
            if isEditMode {
                if let exp = employee?.experience {
                    alertTextField.text = String(exp)
                }
            } else {
                alertTextField.placeholder = "Experience"
            }
            experienceTextField = alertTextField
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)

    }
}

// MARK: - Private Methods
private extension SecondViewController {
    func setRightBarButtonItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                                 style: .plain, target: self,
                                                                 action: #selector(addTapped))
    }
    
    @objc private func addTapped() {
        self.editEmploee()
    }
    
    // MARK: - Load and Save Methods
    private func saveEmploees() {
        do {
            if let context = context {
                try context.save()
            }
        } catch {
            print("Emploees saving error \(error)")
        }
        self.secondView?.update()
    }
    
    private func loadEmploees() {
        let request: NSFetchRequest<Employee> = Employee.fetchRequest()
        if let name = selectedCompany?.name {
            let predicate = NSPredicate(format: "company.name MATCHES %@", name)
            request.predicate = predicate
        }
        do {
            if let context = context {
                let emploees = try context.fetch(request)
                self.staffModel?.setEmploees(with: emploees)
            }
        } catch {
            print("Emploees fatching error \(error)")
        }
        self.secondView?.update()
    }
}
