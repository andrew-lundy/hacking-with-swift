//
//  ViewController.swift
//  Project10
//
//  Created by Andrew Lundy on 9/21/19.
//  Copyright © 2019 Andrew Lundy. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIImagePickerController.isSourceTypeAvailable(.camera)
        UIImagePickerController.availableMediaTypes(for: .camera)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
        
        let userDefaults = UserDefaults.standard
        if let savedPeople = userDefaults.object(forKey: "people") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                people = try jsonDecoder.decode([Person].self, from: savedPeople)
            } catch {
                print("Could not load people")
            }
        }
    }

    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(people) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        } else {
            print("Failed to save people")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
         
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        collectionView.reloadData()
        
        dismiss(animated: true)
        save()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
            fatalError("Unable to dequeue PersonCell!")
        }
        let person = people[indexPath.item]
        
        cell.name.text = person.name
        
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        
        let selectionAC = UIAlertController(title: "Do you want to delete this person or rename them?", message: nil, preferredStyle: .alert)
        selectionAC.addAction(UIAlertAction(title: "Rename", style: .default, handler: { [weak self] alert in
            let ac = UIAlertController(title: "Rename Person", message: nil, preferredStyle: .alert)
            ac.addTextField()
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self, weak ac] alert in
                guard let name = ac?.textFields?[0].text else { return }
                person.name = name
                self?.collectionView.reloadData()
                self?.save()
            }))
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self?.present(ac, animated: true)
        }))
        
        selectionAC.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] alert in
            self?.people.remove(at: indexPath.item)
            self?.collectionView.deleteItems(at: [indexPath])
        }))
        present(selectionAC, animated: true)
    }
}
