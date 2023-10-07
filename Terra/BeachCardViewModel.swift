import Foundation
import Combine

class BeachCardViewModel: ObservableObject {
    static let shared = BeachCardViewModel()
    
    private let userDefaults = UserDefaults.standard
    private let savedKey = "SavedBeachCards"
    
    @Published var savedBeachCards: [BeachCard] = []
    
    init() {
        loadBeachCards()
        
        // Subscribe to UserDefaults changes and update the view model when changes occur
        NotificationCenter.default.publisher(for: UserDefaults.didChangeNotification)
            .sink { [weak self] _ in
                self?.loadBeachCards()
            }
            .store(in: &cancellables)
    }
    
    func saveBeachCard(_ beachCard: BeachCard) {
            if let index = savedBeachCards.firstIndex(where: { $0.id == beachCard.id }) {
                savedBeachCards[index] = beachCard
            } else {
                savedBeachCards.append(beachCard)
            }
            
            saveBeachCards(savedBeachCards)
        }
    
    private func loadBeachCards() {
        if let beachCardData = userDefaults.data(forKey: savedKey),
           let decodedBeachCards = try? JSONDecoder().decode([BeachCard].self, from: beachCardData) {
            savedBeachCards = decodedBeachCards
        }
    }
    
    private func saveBeachCards(_ beachCards: [BeachCard]) {
        if let encodedData = try? JSONEncoder().encode(beachCards) {
            userDefaults.set(encodedData, forKey: savedKey)
            
            // Notify UserDefaults change
            NotificationCenter.default.post(name: UserDefaults.didChangeNotification, object: nil)
        }
    }
    
    func removeBeachCard(_ beachCard: BeachCard) {
        if let index = savedBeachCards.firstIndex(where: { $0.id == beachCard.id }) {
            savedBeachCards.remove(at: index)
            saveBeachCards(savedBeachCards)
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
}
