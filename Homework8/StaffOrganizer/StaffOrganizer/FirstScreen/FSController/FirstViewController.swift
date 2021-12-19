//
//  FirstViewController.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 16.12.2021.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {
    // MARK: - Properties
    private var firstView: IFirstView?
    private var staffModel: IStaffModel?
    
    let context: NSManagedObjectContext?
    
    // MARK: - Initialization
    init() {
        self.firstView = FirstView(frame: UIScreen.main.bounds)
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
        self.firstView?.loadView(controller: self)
        self.setRightBarButtonItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Companies"
        
        self.loadCompanies()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.firstView?.configView()
        self.firstView?.backgroundColor = .white
        if let firstView = firstView {
            self.view.addSubview(firstView)
        }
    }
}

    // MARK: - IFirsrViewController Methods
extension FirstViewController: IFirstViewController {
    func getCompanies() -> [Company] {
        return staffModel?.getCompanies() ?? [Company]()
    }
    
    func moveToSecondVC(with company: Company) {
        let secondVC = SecondViewController()
        secondVC.selectedCompany = company
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func deleteCompany(at index: Int) {
        if let company = staffModel?.getCompanies()[index] {
            if let context = context {
                context.delete(company)
                staffModel?.deleteCompany(at: index)
                saveCompanies()
            }
        }
    }
}

    // MARK: - Private Methods
private extension FirstViewController {
    func setRightBarButtonItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                            style: .plain, target: self,
                                                            action: #selector(addTapped))
    }
    
    @objc private func addTapped() {
        self.addCompany()
    }
    
    private func addCompany() {
        var textField = UITextField()
        let alertController = UIAlertController(title: "Add new company",
                                                message: nil,
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add", style: .default) {[weak self] action in
            if let text = textField.text {
                guard !text.isEmpty else { return }
                
                let company = Company(context: self?.context ?? NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType))
                company.name = text
                self?.staffModel?.addCompanies(with: company)
                self?.saveCompanies()
            }
            self?.firstView?.update()
        }
        
        alertController.addTextField { alertTextField in
            alertTextField.placeholder = "Enter company name"
            textField = alertTextField
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    // MARK: - Load and Save Methods
    private func saveCompanies() {
        do {
            if let context = context {
                try context.save()
            }
        } catch {
            print("Company saving error \(error)")
        }
        self.firstView?.update()
    }
    
    private func loadCompanies() {
        let request: NSFetchRequest<Company> = Company.fetchRequest()
        do {
            if let context = context {
                let companies = try context.fetch(request)
                self.staffModel?.setCompanies(with: companies)
            }
        } catch {
            print("Company fatching error \(error)")
        }
    }
}
