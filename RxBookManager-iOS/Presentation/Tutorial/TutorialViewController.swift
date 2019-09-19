import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var pageControll: UIPageControl!
    let pageNum = 4
    let pageColors:[Int:UIColor] = [1: .red,2: .yellow,3: .blue,4: .green]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = UIScrollView(frame: self.view.bounds)
//        self.scrollView.contentSize = CGRect(origin: self.view.bounds.width * CGFloat(pageNum), size: self.view.bounds.height)
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.delegate = self;
        self.view.addSubview(self.scrollView)

        self.pageControll = UIPageControl(frame: CGRect(x: 0, y: self.view.bounds.height-50, width: self.view.bounds.width, height: 50))

        self.pageControll.numberOfPages = pageNum
        self.pageControll.currentPage = 0
        self.view.addSubview(self.pageControll)

        for p in 1...pageNum {
            var v = UIView(frame: CGRect(x: self.view.bounds.width * CGFloat(p-1), y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
            v.backgroundColor = self.pageColors[p]
            self.scrollView.addSubview(v)
        }
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var pageProgress = Double(scrollView.contentOffset.x / scrollView.bounds.width)
        self.pageControll.currentPage = Int(round(pageProgress))

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
