import UIKit

import Combine

// MARK: Subscriber

//class StringSubscriber: Subscriber{
//
//    func receive(subscription: Subscription) { // runs when receives the subscription
//        print("received subscription")
//        subscription.request(.max(2)) // (optional) backpressure - limit the data that the publisher is sending you
//    }
//
//    func receive(_ input: String) -> Subscribers.Demand { // gets the value
//        print("recieved value: ", input)
//        return .unlimited // you can change your backpressure demand here also if you want, we dongt need to do that now though
//    }
//
//    func receive(completion: Subscribers.Completion<Never>) { // receives the completion
//        print("completed")
//    }
//
//
//    typealias Input = String  // this string subscriber is going to be working on these kind of values
//    typealias Failure = Never // types of errors to expect from the subscriber
//
//
//}
//
//
//
//let publisher = ["A","B","C","D"].publisher
//
//let subscriber = StringSubscriber()
//
//publisher.subscribe(subscriber)

    
    
// MARK: Subjects


//enum MyError : Error{
//    case subError
//}
//
//class StringSubscriber: Subscriber {
//    func receive(subscription: Subscription) {
//        subscription.request(.max(2))
//    }
//
//    func receive(_ input: String) -> Subscribers.Demand {
//        print(input)
//        return .max(1)
//    }
//
//    func receive(completion: Subscribers.Completion<MyError>) {
//        print("Completion")
//    }
//
//
//    typealias Input = String
//    typealias Failure = MyError
//}
//
//
//let subscriber = StringSubscriber()
//
//let subject = PassthroughSubject<String, MyError>() // passthrough subject allows you to publish new values on demand
//
//subject.subscribe(subscriber)
//
//
//
//let subscription = subject.sink(receiveCompletion: { (completion) in
//    print("received Completion from sink: ", completion)
//}, receiveValue: { Value in
//    print("Received Value from sink: ", Value)
//})
//
//subject.send("A")
//subject.send("B")
//
//subscription.cancel()
//
//subject.send("C")
//subject.send("D")


// MARK: type eraser

//let pub = PassthroughSubject<Int, Never>().eraseToAnyPublisher() // hides the fact that pub is a passthrough subject by returning type anyoublisher
//pub.send // see this doesnt work



// MARK: tranforming operators

//["A","B","C"].publisher.collect().sink(receiveValue: {value in
//    print(value)
//}) // so what the collect function has done here is it has changed what is returned with "print(value)" to print out an array of the values instead of one at a time
    // NOTE: you can pass in a integer to collect and that will determin what size of arrays to try to group the values into


let formatter = NumberFormatter()
formatter.numberStyle = .spellOut
[123,45,67].publisher.map { T in
    formatter.string(from: NSNumber(integerLiteral: T)) ?? ""
}.sink { value in
    print(value)
}

