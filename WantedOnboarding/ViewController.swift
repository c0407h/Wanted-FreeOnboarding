//
//  ViewController.swift
//  WantedOnboarding
//

import UIKit

class ViewController: UIViewController {
    
    enum CellType {
        case loadImage
        case loadAllImage
    }
    
    var cellType: [CellType] {
        var cellType: [CellType] = []
        
        for _ in 0 ..< 5 {
            cellType.append(.loadImage)
        }
        cellType.append(.loadAllImage)
        
        return  cellType
        
    }
    
    @IBOutlet weak var loadingTV: UITableView!
    
    var imageUrl : String {
        return ["https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F24283C3858F778CA2E",
                
                "https://blog.kakaocdn.net/dn/kZbS4/btrTRpNeD37/oXP7nDDwy6GUxilYQfdoWk/img.png",
                "https://cdn.crowdpic.net/detail-thumb/thumb_d_2F583E5543F7E19139C6FCFFBF9607A6.jpg",
                "https://dalkompet.com/wp-content/uploads/2020/04/강아지-사회화-시기.jpg",
                "https://dalkompet.com/wp-content/uploads/2020/04/강아지-사회화-훈련-교육-사진.jpg",
                "https://cdn.aitimes.kr/news/photo/202210/26245_39460_5429.jpg",
                "https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525081724428qquq.jpg",
                "https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525081728147opbd.jpg"].randomElement() ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadingTV.delegate = self
        self.loadingTV.dataSource = self
        self.loadTVCell()
    }
    
    func loadTVCell() {
        self.loadingTV.register(UINib(nibName: "ImageLoadTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageLoadTableViewCell")
        self.loadingTV.register(UINib(nibName: "ImageAllLoadTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageAllLoadTableViewCell")
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellType[indexPath.row] {
        case .loadImage:
            if let cell = self.loadingTV.dequeueReusableCell(withIdentifier: "ImageLoadTableViewCell", for: indexPath) as? ImageLoadTableViewCell{
                cell.delegate = self
                cell.indexPath = indexPath.row
                return cell
            }
        case .loadAllImage:
            if let cell = self.loadingTV.dequeueReusableCell(withIdentifier: "ImageAllLoadTableViewCell", for: indexPath) as? ImageAllLoadTableViewCell{
                cell.delegate = self
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}

extension ViewController : TVCellDelegate {
    func imageLoad(indexPath: Int) {
        DispatchQueue.global().async {
            guard let url = URL(string: self.imageUrl) else { return }
            
            let data = try! Data(contentsOf: url)
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                if let cell = self.loadingTV.cellForRow(at: IndexPath(row: indexPath, section: 0)) as? ImageLoadTableViewCell {
                    cell.loadImageView.image = image
                }
            }
        }
    }
    
    func imageAllLoad() {
        for i in 0 ..< 5 {
            DispatchQueue.global().async {
                guard let url = URL(string: self.imageUrl) else { return }
                
                let data = try! Data(contentsOf: url)
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    if let cell = self.loadingTV.cellForRow(at: IndexPath(row: i, section: 0)) as? ImageLoadTableViewCell {
                        cell.loadImageView.image = image
                    }
                }
            }
        }
        
    }
}
