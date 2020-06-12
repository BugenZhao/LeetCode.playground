let tags: [Tag] = [.hash]

class RandomizedSet {
    var indexOf = [Int: Int]()
    var array = [Int]()

    /** Initialize your data structure here. */
    init() {

    }

    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if let _ = indexOf[val] {
            return false
        } else {
            array.append(val)
            indexOf[val] = array.count - 1;
            return true
        }
    }

    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if let index = indexOf[val] {
            array[index] = array.last!
            array.popLast()!
            indexOf.removeValue(forKey: val)!
            if index < array.count { indexOf[array[index]] = index }
            return true
        } else {
            return false
        }
    }

    /** Get a random element from the set. */
    func getRandom() -> Int {
        return array.randomElement()!
    }
}

let set = RandomizedSet()
set.insert(1) == true
set.insert(2) == true
set.remove(3) == false
set.remove(2) == true
set.remove(2) == false
set.getRandom() == 1
set.array.count == 1
