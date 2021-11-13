import UIKit
import Combine
import Foundation

["A", "B", "C" , "D" , "E"].publisher
    .collect(3)
    .sink(receiveValue: {
    print($0)
})

let numbers = (1 ... 5000).publisher.sink(receiveCompletion: { _ in
    print("Completed")
}, receiveValue: { input in
    print(input)
})

func subjectExampleWithSendFunctionAndPublisher() {
let subject = CurrentValueSubject<String, Never>("Knowledge Meet")
let anyCancellable = subject
.sink { value in
print(value)
}
// Below send function is always used to send values to the subscriber..
subject.send("Sending first object")
subject.send("Sending second object")
subject.send("Sending Third object")
let _ = Just("Publishing the Value for subject")
.subscribe(subject)
anyCancellable.cancel()
}

subjectExampleWithSendFunctionAndPublisher()

