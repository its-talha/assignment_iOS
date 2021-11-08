//
//  ViewController.swift
//  iOSAssessment-12
//
//  Created by Mohammad Talha on 20/10/21.
//

import UIKit

//extension for downloading image and setting to imageView

//Link for downloading particular image
let defaultLink = "https://picsum.photos/200/300?image="

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    let network = NetworkFile()
    var imageList = [Images]()
    var queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        network.delegate = self
        network.callingApi()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        for i in imageList{
            print(i.id,":",i.author)
        }
    }
    
    //Customizing the Navbar
    func setUpNavBar(){
        navigationItem.title = "Gallery App"
        navigationController?.navigationBar.barTintColor = UIColor.systemPink
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }

    //populating the collectionView with data from API
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.nameLbl.text = imageList[indexPath.row].author.capitalized
        let completeLink = defaultLink + String(imageList[indexPath.row].id)
//        cell.imageView.downloaded(from: completeLink)
        
        var img: UIImage!
               let operation = BlockOperation(block: {
                   img  = Downloader.downloadImageWithURl(completeLink)
               })

               operation.completionBlock = {
                   DispatchQueue.main.async {
                    cell.imageView.image = img
                   }

               }
               queue.addOperation(operation)
        
        return cell
    }
    
    //handling the click of item in collectionView
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondVC") as? SecondVC
        vc?.imageId = String(imageList[indexPath.row].id)
        vc?.author_url = String(imageList[indexPath.row].author_url)

        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

//Conforming to flow layout and designing collectionView
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
extension ViewController : CallingApiDelegate{
    func successfulResponse(arr: [Images]) {
        imageList = arr
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func failedwithError(error: String) {
        print(error)
    }
    
    
}

//class for downloading image and setting it on imageview
class Downloader {
    class func downloadImageWithURl(_ url: String) -> UIImage! {
        if let data = try? Data(contentsOf: URL(string: url)!) {
            return UIImage(data: data)!
        }
        return nil
    }

}

