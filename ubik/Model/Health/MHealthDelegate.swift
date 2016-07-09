import Foundation

protocol MHealthDelegate
{
    func healthAuthorizationAsked()
    func healthStepsSaved()
    func healthStepsError(error:String)
}