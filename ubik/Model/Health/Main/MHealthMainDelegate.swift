import Foundation

protocol MHealthMainDelegate
{
    func healthAuthorizationAsked()
    func healthStepsSaved()
    func healthStepsError(error:String)
}