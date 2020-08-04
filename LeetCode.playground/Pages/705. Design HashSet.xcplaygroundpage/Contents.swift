let tags: [Tag] = [.hash]

final class MyHashSet {
    var count = 0
    var arr: [[Int]]

    let initialCapa = 8

    var capacity: Int {
        return arr.count
    }

    /** Initialize your data structure here. */
    init() {
        arr = .init(repeating: [], count: initialCapa)
    }

    private func resize(to newCapa: Int) {
        var newArr = [[Int]](repeating: [], count: newCapa)
        arr.flatMap { $0 }.forEach { key in
            newArr[abs(key.hashValue % newCapa)].append(key)
        }
        arr = newArr
    }

    func add(_ key: Int) {
        if count >= capacity { resize(to: capacity * 2) }
        let hash = abs(key.hashValue % capacity)
        if !arr[hash].contains(key) {
            arr[hash].append(key)
            count += 1
        }
    }

    func remove(_ key: Int) {
        if count <= capacity / 4, capacity > initialCapa { resize(to: capacity / 2) }
        let hash = abs(key.hashValue % capacity)
        if let index = arr[hash].firstIndex(of: key) {
            arr[hash].remove(at: index)
            count -= 1
        }
    }

    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let hash = abs(key.hashValue % capacity)
        return arr[hash].contains(key)
    }
}

extension MyHashSet: CustomStringConvertible {
    var description: String {
        return "\(type(of: self)) \(arr.flatMap { $0 })"
    }
}

let hashSet = MyHashSet();
hashSet.add(1);
hashSet.add(2);
hashSet.contains(1); // returns true
hashSet.contains(3); // returns false (not found)
hashSet.add(2);
hashSet.contains(2); // returns true
hashSet.remove(2);
hashSet.contains(2); // returns false (already removed)


let set = MyHashSet()
(1...100).forEach { set.add($0) }
set.count
dump(set)
(1...200).forEach { set.remove($0) }
set.count
dump(set)
