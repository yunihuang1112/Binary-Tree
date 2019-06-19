import UIKit

class TreeNode<T> {
    var data: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    init(data: T, leftNode: TreeNode? = nil, rightNode: TreeNode? = nil) {
        self.data = data
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

class BinaryTree<T: Comparable & CustomStringConvertible> {
    private var rootNode: TreeNode<T>?
    
    func insertElement(_ elememt: T) {
        let node = TreeNode(data: elememt)
        if let root = self.rootNode {
            insert(rootNode: root, node: node)
        } else {
            self.rootNode = node
        }
    }
    
    fileprivate func insert(rootNode: TreeNode<T>, node: TreeNode<T>) {
        if rootNode.data >= node.data {
//            print(">")
            if let left = rootNode.leftNode {
                insert(rootNode: left, node: node)
            } else {
                rootNode.leftNode = node
            }
        } else {
//            print("<")
            if let right = rootNode.rightNode {
                insert(rootNode: right, node: node)
            } else {
                rootNode.rightNode = node
            }
        }
    }
    
    func showPrint() {
        print("\n === preOrder ===")
        self.preOrder(self.rootNode)
        print("\n")
        print("\n === inOrder ===")
        self.inOrder(self.rootNode)
        print("\n")
        print("\n === postOrder ===")
        self.postOrder(self.rootNode)
        print("\n")
    }
    
    private func inOrder(_ node: TreeNode<T>?) {
        guard let _ = node else {
            return
        }
        
        inOrder(node?.leftNode)
        print("\(node!.data)", terminator: " ")
        inOrder(node?.rightNode)
    }
    
    private func preOrder(_ node: TreeNode<T>?) {
        guard let _ = node else {
            return
        }
        
        print("\(node!.data)", terminator: " ")
        preOrder(node?.leftNode)
        preOrder(node?.rightNode)
    }
    
    private func postOrder(_ node: TreeNode<T>?) {
        guard let _ = node else {
            return
        }
        
        postOrder(node?.leftNode)
        postOrder(node?.rightNode)
        print("\(node!.data)", terminator: " ")
    }
}

extension BinaryTree {
    func search(_ element: T) {
        let isExist = searchElement(element: element, node: rootNode)
        if isExist {
            print("Node \(element) has exist in tree.\n")
            
        } else {
            print("Node \(element) does not exist in tree.\n")
        }
    }
    
    private func searchElement(element: T, node: TreeNode<T>?) -> Bool {
        guard let root = node else {
            return false
        }
        
        if root.data > element {
            return searchElement(element: element, node: root.leftNode)
        } else if root.data < element {
            return searchElement(element: element, node: root.rightNode)
        } else {
            return true
        }
    }
}

extension BinaryTree {
    func isUnivalTree() {
        print("isUnivalTree === ")
        print(isUnivalTree(rootNode))
        print("\n")
    }
    
    private func isUnivalTree(_ root: TreeNode<T>?) -> Bool {
        guard let rootNode = root else {
            return false
        }
        
        let isL = (rootNode.leftNode == nil) || (isUnivalTree(rootNode.leftNode!) && (rootNode.data == rootNode.leftNode!.data))
        let isR = (rootNode.rightNode == nil) || (isUnivalTree(rootNode.rightNode!) && (rootNode.data == rootNode.rightNode!.data))
        return isL && isR
    }
}

let tree = BinaryTree<Int>()
//let tree = BinaryTree<String>()

tree.insertElement(1)
tree.insertElement(5)
tree.insertElement(2)
tree.insertElement(7)
tree.insertElement(8)
tree.insertElement(10)
tree.insertElement(9)
tree.insertElement(6)

//tree.insertElement("D")
//tree.insertElement("E")
//tree.insertElement("I")
//tree.insertElement("J")
//tree.insertElement("A")
//tree.insertElement("B")
//tree.insertElement("C")

tree.showPrint()

// search
tree.search(5)
tree.search(4)
tree.search(10)

//tree.search("A")
//tree.search("H")


// isUnivalTree
//tree.insertElement(8)
//tree.insertElement(8)
//tree.insertElement(8)
//tree.insertElement(8)
//tree.insertElement(8)

tree.isUnivalTree()
