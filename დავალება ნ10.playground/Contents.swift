import Foundation

/* პირობა:
 1. შექმენით ციკლური რეფერენცები და გაწყვიტეთ
 2. აუცილებელია ქლოჟერების გამოყენება
 3. აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)
 4. აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
 5. დაიჭირეთ self ქლოჟერებში
 6. გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით
 */

//MARK: - დავალება.

enum SpellType { // 3. აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)
    case elemental
    case holy
    case dark
}

protocol CastMagic {
    func castSpell()
    func prepareSpell()
}

class Companion {
    var name: String
    weak var master: MagicUser? // 4. აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) the Companion is being deinitialized")
    }
}

class MagicUser {
    var name: String
    var spellType: SpellType
    var companion: Companion? // 1. შექმენით ციკლური რეფერენცები და გაწყვიტეთ
    var performSpecialAction: (() -> Void) // 2. აუცილებელია ქლოჟერების გამოყენება
    
    init(name: String, spellType: SpellType, performSpecialAction: @escaping () -> Void) {
        self.name = name
        self.spellType = spellType
        self.performSpecialAction = performSpecialAction
    }
    
    func prepareSpecialAction() {
        // Strong reference self - ზე
        performSpecialAction = { [weak self] in
            guard let self = self else { return }
            print("\(self.name) is performing a special action with their \(self.spellType) powers!") // 5. დაიჭირეთ self ქლოჟერებში
        }
    }
    
    deinit {
        print("\(name) the MagicUser is being deinitialized")
    }
}

class Paladin: MagicUser, CastMagic {
    func castSpell() {
        print("\(name) the Paladin casts a \(spellType) spell!")
    }
    
    func prepareSpell() {
        print("\(name) the Paladin is preparing their spell...")
    }
    
    
    override func prepareSpecialAction() {
        // Strong reference self - ზე
        performSpecialAction = { [unowned self] in // 4. აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
            print("\(self.name) the Paladin shines with \(self.spellType) light!") // 5. დაიჭირეთ self ქლოჟერებში
        }
    }
    
    deinit {
        print("\(name) the Paladin is being deinitialized")
    }
}

class DarkMage: MagicUser, CastMagic {
    func castSpell() {
        print("\(name) the DarkMage casts a \(self.spellType) spell!")
    }
    
    func prepareSpell() {
        print("\(name) the DarkMage is gathering dark energy...")
    }
    
    override func prepareSpecialAction() {
        // Strong reference self - ზე
        performSpecialAction = { [weak self] in
            guard let self = self else { return }
            print("\(self.name) the DarkMage engulfs the surroundings in \(self.spellType) darkness!") // 5. დაიჭირეთ self ქლოჟერებში
        }
    }
    
    deinit {
        print("\(name) the DarkMage is being deinitialized")
    }
}

// 6. გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით

struct MemoryManagementExample { // 3. აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, !!სტრუქტურები!!, ენამები და პროტოკოლები) STRUCT აუცილებელი არაა, უბრალოდ ყველა დავალება რო დავაკმაყოფილო :).
    func deallocation() {
        var paladin: Paladin = Paladin(name: "Arthur", spellType: .holy, performSpecialAction: {
            print("Arthur the Paladin uses a special holy action!")
        })
        var darkMage = DarkMage(name: "Morgana", spellType: .dark, performSpecialAction: {
            print("Morgana the DarkMage unleashes a special dark spell!")
        })
        var companion = Companion(name: "Merlin")
        
        paladin.companion = companion // 1. შექმენით ციკლური რეფერენცები და გაწყვიტეთ
        companion.master = paladin // 1. შექმენით ციკლური რეფერენცები და გაწყვიტეთ
        
        //Arthur:
        paladin.prepareSpecialAction()
        paladin.castSpell()
        paladin.performSpecialAction()
        //Morgana:
        darkMage.prepareSpell()
        darkMage.castSpell()
        darkMage.performSpecialAction()
        
        //Deallocation
        paladin.companion = nil
        companion.master = nil
    }
}

var example: MemoryManagementExample? = MemoryManagementExample()
example?.deallocation()
example = nil
