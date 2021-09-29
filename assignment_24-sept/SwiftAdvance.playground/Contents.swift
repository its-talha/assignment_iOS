import UIKit

//Q1:-What is extension?
/*Sol: Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you don’t have access to the original source code (known as retroactive modeling). Extensions are similar to categories in Objective-C.
    Extensions in Swift can:

        *Add computed instance properties and computed type properties
        *Define instance methods and type methods
        *Provide new initializers
        *Define subscripts
        *Define and use new nested types
        *Make an existing type conform to a protocol
 */

//Q2:-Create a class and write the delegate of UITextField in extension of that class.
//Sol:

class ModifiedTextField: UITextField {

    override func awakeFromNib() {
        delegate = self
    }
 }
 extension ModifiedTextField : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        fieldEmptyError(value: false)

    }
    func fieldEmptyError(value: Bool){

        let textFieldVal = "\(self.placeholder!)"

        if (value){
            layer.borderColor = UIColor.red.cgColor
            layer.cornerRadius = 5.0
            layer.masksToBounds = true
            layer.borderWidth = 1
            pulsate()
            textFieldOrigVal(string: textFieldVal, borderColor: UIColor.red)
        }else {

            textFieldOrigVal(string: textFieldVal, borderColor: UIColor.lightGray)
            layer.borderWidth = 0.2
            layer.borderColor = UIColor.lightGray.cgColor

        }
    }
}
