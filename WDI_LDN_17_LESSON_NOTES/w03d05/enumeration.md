WDI
======
## Enumerators and Enumerables

###Learning Objectives:

- Explain what is enumerable
- Apply using enumerable on arrays and hashes
- Describe different types of enumerables

<br>

---

| **Section**      | **Timing** | **Summary** |
|------------------|------------|-------------|
| Opening: Enumerables, and they work with blocks | 10 mins    |             
| I Do             | 10 mins    | 
| We Do            | 10 mins    |  
| You Do           | 15 mins    |                  
| Assess           | 15 mins    |                   
| Lab              | 30 mins    | 
| Closure          | 10 mins    |                                               
| Questions        | 10 mins    |  

<br>

---
###Connection to a long term learning goal 

Describe to the students how to iterate over complex structures with ruby using blocks

<br>

---

###Before Class (Student Pre-work)

Students must understand blocks and arrays/hashes before this lesson

<br>

---

###Related Homework	

N/A

<br>

---

Enumerators and Enumerables
=====

##Opening: Enumerables, and they work with blocks

We have already touched on blocks, if we've seen code like:

```
10.times { |i| print i, " " }
```

A block is a portion of code that is passed to a method - in fact, blocks can be considered little methods of their own, just with no name.
  
Used very often with "enumerable" objects (Arrays, Hashes) to run the block against each element in the collection.

For this lesson we will use some of the enumerable methods to demonstrate blocks. You will use these methods *all the time* in your Ruby programming career, so become very familar with them.

- Demonstrate googling for "ruby api array", "ruby api enumerable" - re-inforce how important it is to remember to do this, and to read this 

```  
  def print_name(name)
    print "#{name}, "
  end

  names = %w(Fred Wilma Barney) 

  for i in 0..names.size
    print_name(names[i])
  end
```

  or...
  
```
  %w(Fred Wilma Barney).each { |name| print_name(name) }
```

  or ...
  
```
  %w(Fred Wilma Barney).each do |name| 
    print_name(name)
  end
```

  - We generally use {} for one-line blocks, and "do..end" for multiline blocks


<br>
##I Do: Simple enumerator: .each()

Blocks are a general-purpose part of the Ruby language, but you most often use them when working with "enumerable" objects, these are objects that contain a collection of things (Arrays and Hashes).

Enumerators become useful when you work with hashes or arrays and want to list or transform values inside them.

Array and Hash both include a module called "Enumerable" and thus get a bunch of useful methods, many of which expect a block to be passed. When we cover modules tomorrow, we'll see how we can add the Enumerable method to our own classes.


Examples:

```ruby
arr = [1,2,3,4,5]
arr.each { |num| puts "the number is #{num}" }
```

The value within the pipes (`||`) is the current value from the array which is being passed to the block on each iteration. `num` is a variable, it can be changed to whatever value you like. `num` is also local only to the block, which means that you cannot access it outside the block.

```ruby
hash = {foo: 1, bar: 2}
hash.each { |key, value| puts "key was #{key}, value was #{value}" }
```

We can do anything with the code inside our block. For example we can use an if statement.

Example:  

```ruby
arr = []
(1..10).each{ |i| a << i if i.odd? }
```

A variation on #each is #each_with_index. We can use this to rank instructors by how much they love ruby:

```ruby
  %w[jon gerry tim].each_with_index do |name, index|
    puts "#{index} => #{name}"
  end
```


<br>
##We Do: Use various enumerators

####Map:

The `.map` method invokes the given block once for each element of the block. We use it to transform an array, as it returns a new array of the same size as the original, but with each value substituted with whatever the block returns.

`collect` is an alias of `map`

```
numbers = (1..10).to_a
numbers_as_strings = numbers.map { |num| num.to_s }

names = ["fred", "wilma"]
rev_names = names.map { |n| n.reverse }
#=> ["derf", "amliw"]
```
####Reduce:

The `.inject` (aka `.reduce`) method combines all the elements of the enumeration by applying a binary operation, specified by a block or a symbol that names a method or operator.

If you specify a block, then for each element in the enumeration the block is passed an accumulator value (memo) and the element. If you specify a symbol instead, then each element in the collection will be passed to the named method of memo. In either case, the result becomes the new value for memo. At the end of the iteration, the final value of memo is the return value for the method.

If you do not explicitly specify an initial value for memo, then the first element of collection is used as the initial value of memo.

Examples:

```
# Sum some numbers
(5..10).reduce(:+)
=> 45

# Same using a block and inject:
(5..10).inject { |sum, n| sum + n }
=> 45

# Multiply some numbers
(5..10).reduce(1, :*)
=> 151200

# Same using a block:
(5..10).inject(1) { |product, n| product * n }
=> 151200

#Find the longest word:
longest = %w{ cat sheep bear }.inject do |memo, word|
  memo.length > word.length ? memo : word
end

longest
=> "sheep"
```

####Select:

Alternatively we can use `.select` to return an array of values which equate to true once passed through our block.

Examples:

```
(1..10).select { |i| i.odd? }
(1..10).find_all { |i| i.even? }  

(1..10).select { |i| i % 3 == 0 }
#=> [3, 6, 9]
```

####Group_by:

To group our objects, we have a `.group_by` method:  

```
(1..10).group_by { |i| i % 3 == 0}    
RETURNS   {false: [1,2,4,5,7,8,10], true: [3,6,9]}
```

## Interesting!

It’s possible to find out which classes use Enumerable with Object#included_modules.

```ruby
Array.included_modules
=> [Enumerable, Kernel]
```

It is possible to see what all methods are provided by Enumerable by checking the output of the #instance_methods method.

```ruby
>> Enumerable.instance_methods.sort
=> [:all?, :any?, :chunk, :collect, :collect_concat, :count, :cycle,
    :detect, :drop, :drop_while, :each_cons, :each_entry, :each_slice,
    :each_with_index, :each_with_object, :entries, :find, :find_all, 
    :find_index, :first, :flat_map, :grep, :group_by, :include?, :inject, 
    :map, :max, :max_by, :member?, :min, :min_by, :minmax, :minmax_by, 
    :none?, :one?, :partition, :reduce, :reject, :reverse_each, :select, 
    :slice_before, :sort, :sort_by, :take, :take_while, :to_a, :zip]
```

Enumerable#grep.

```
>> [6, 14, 28, 47, 12].grep(5..15)
=> [6, 14, 12]

>> [0.3, "three", :three, "thirty-three"].grep /three/
=> ["three", :three, "thirty-three"]
```

## I Do: Enumerables vs Enumerator

Enumerator objects is that they contain the information about how to iterate through a collection. For example, a #cycle Enumerator knows how to iterate through a collection one or more times, while a `reverse_each` Enumerator knows how to iterate through a collection backwards.

If `cycle` is not passed a block, it will return an Enumerator.

```
>> cycle_enum = arr.cycle
=> #>Enumerator: ["first", "middle", "last"]:cycle>
```

Now, Enumerator#next can be used to retrieve the next element as many times as necessary.

```
>> cycle_enum.next
=> "first"
>> cycle_enum.next
=> "middle"
>> cycle_enum.next
=> "last"
>> cycle_enum.next
=> "first"

```
This works because the Enumerator specifically came from #cycle. Watch what happens when a regular #each Enumerator is used.

```
>> each_enum = arr.each
>> each_enum.next
=> "first"
>> each_enum.next
=> "middle"
>> each_enum.next
=> "last"
>> each_enum.next
=> StopIteration: iteration reached an end
```

Note: You can’t just use #next on #cycle and #each.

```
>> arr.cycle.next
=> "first"
>> arr.cycle.next
=> "first"
>> arr.cycle.next
=> "first"
```

This is because iterator methods return a fresh Enumerator every time.

```
>> arr.cycle.object_id == arr.cycle.object_id
=> false
```

<br>
##You Do

<br>
##Assess

<br>
##Lab

```
$ valid = []
$(0..10).to_a.each do |value|
$  if value % 3 == 0
$    valid.push value
$  end
$ end
```

```
$ valid = []
$(0..10).to_a.each do |value|
$  valid.push(value) if value % 3 == 0
$ end
```

```
$ valid = (0..10).to_a.select{ |value| value % 3 == 0}
```

```
$ valid = []
$ (0..10).to_a.each do |value|
$   new_value = value*3
$   valid.push new_value
$ end
```

```
$ def gimme_an_array
$   ["cat", "dog", "fish"]
$ end
$ valid = gimme_an_array.to_a.collect{ |value| "#{value} is cool" }
$ valid = ["cat1", "cat2"].each{ |value| "cat" }
```
```
$ instructors = {
$   instructor1: "Gerry",
$   instructor2: "Jon",
$   instructor3: "David",
$   instructor4: "Julien",
$ }
```

```
$ ["cat", "dog", "fish"].each_with_index do |value, index|
$   puts "the index of #{value} is #{index}"
$ end
```
```
$(1..10).to_a.find_all{ |value| value % 3 == 0}
```

<br>
##Closure

Enumerables are an essential part of every ruby program. Without them, iterating and manipulating complex data types such as arrays and Hashes would be impossible, there is an enumerator for every case, if you create some logic where an empty variable or array is supposed to be populated later in the code by a block content, you're probably missing the use of an enumerable which could make your code simpler.

<br>
###CFU

<br>

###Questions
<br>
