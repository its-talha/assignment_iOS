//
//  ViewController.swift
//  iOSAssessment-12
//
//  Created by Mohammad Talha on 20/10/21.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


struct Images : Decodable{
    let author : String
    let id : Int
    let author_url : String
}

let defaultLink = "https://picsum.photos/200/300?image="

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageList = [Images]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let url = URL(string: "https://picsum.photos/list")
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            if error == nil{
                
                do{
                self.imageList = try JSONDecoder().decode([Images].self, from: data!)
                }catch{
                    print("Parse Error")
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }.resume()
        
    }
    
    func setUpNavBar(){
        
        navigationController?.navigationBar.barTintColor = UIColor.gray
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .camera, target: nil, action: nil)
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.nameLbl.text = imageList[indexPath.row].author.capitalized
        cell.imageView.contentMode = .scaleToFill
        
        let completeLink = defaultLink + String(imageList[indexPath.row].id)
        
        cell.imageView.downloaded(from: completeLink)
        cell.imageView.contentMode = .scaleToFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondVC") as? SecondVC
        vc?.imageId = String(imageList[indexPath.row].id)
        vc?.author_url = String(imageList[indexPath.row].author_url)

        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 40 ) / 2, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //.zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
