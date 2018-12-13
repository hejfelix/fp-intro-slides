
### Introduction to 

## <span style="color:#FF3456">_Strict Functional Programming_</span>

![explain-to-me](/images/explain.png)



---

## Why do I need it?

---

### You don't...

## But! <!-- .element: class="fragment fade-up" -->


Functional Programming (FP) is already used in a multitude of modern applications! <!-- .element: class="fragment fade-up" -->

---
## Frontend

**React.js** (_Stateless_) Functional Components 

<span class="fragment fade-in">
		<span class="fragment fade-out">I'll fade in, then out</span>
	</span>

```
import { useState } from 'react';

function Example() {
  // Declare a new state variable, which we'll call "count"
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```
_(now with 110% better with hooks)_ <!-- .element: class="fragment fade-up" -->

---
### Functional programming space for frontend is BOOMING!
* Elm <!-- .element: class="fragment fade-up" -->
* Purescript <!-- .element: class="fragment fade-up" -->
* ReasonML <!-- .element: class="fragment fade-up" -->
* Scala.js <!-- .element: class="fragment fade-up" -->
* ClojureScript <!-- .element: class="fragment fade-up" -->
* F# (Fable) <!-- .element: class="fragment fade-up" -->
* JavaScript _(RamdaJS,UnderscoreJS,lodash,...)_ <!-- .element: class="fragment fade-up" -->
---

### C# LINQ

```
var queryLondonCustomers = from cust in customers
                           where cust.City == "London"
                           select cust.name;

/*
* Is desugared into:
*/

var queryLondonCustomers = customers
    .Where(cust => cust.City == "London")
    .Select(cust => cust.name)
```


---

### Dinosaur languages are also joining the party!

<img src="/images/dinos.png" width=40%>

---

### Distributed programming


---
### Word Count 
Imperative (_Java_)

```
public class WordCount {

  public static class TokenizerMapper
       extends Mapper<Object, Text, Text, IntWritable>{

    private final static IntWritable one = new IntWritable(1);
    private Text word = new Text();

    public void map(Object key, Text value, Context context
                    ) throws IOException, InterruptedException {
      StringTokenizer itr = new StringTokenizer(value.toString());
      while (itr.hasMoreTokens()) {
        word.set(itr.nextToken());
        context.write(word, one);
      }
    }
  }

  public static class IntSumReducer
       extends Reducer<Text,IntWritable,Text,IntWritable> {
    private IntWritable result = new IntWritable();

    public void reduce(Text key, Iterable<IntWritable> values,
                       Context context
                       ) throws IOException, InterruptedException {
      int sum = 0;
      for (IntWritable val : values) {
        sum += val.get();
      }
      result.set(sum);
      context.write(key, result);
    }
  }

  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    Job job = Job.getInstance(conf, "word count");
    job.setJarByClass(WordCount.class);
    job.setMapperClass(TokenizerMapper.class);
    job.setCombinerClass(IntSumReducer.class);
    job.setReducerClass(IntSumReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
```

---
### Word Count 

Functional (_Scala_)

```
val textFile = sc.textFile("hdfs://...")
val counts = textFile.flatMap(line => line.split(" "))
                 .map(word => (word, 1))
                 .reduceByKey(_ + _)
counts.saveAsTextFile("hdfs://...")
```

---

## But...

### Java 8+ has lambdas!

---

# EXACTLY


```
public class WordCount {

    public static Map<String, Long> countWords(Stream<String> names) {
        return names.collect(groupingBy(name -> name, counting()));
    }

}
```

---

## Lambda Calculus

* **Variables** \\[x\\]
* **Abstraction** \\[ \lambda x . y\\]
* **Application** \\[x y\\]

\\[
\begin{aligned}
\dot{x} &amp; = \sigma(y-x) \\\
\dot{y} &amp; = \rho x - y - xz \\\
\dot{z} &amp; = -\beta z + xy
\end{aligned} 
\\]

https://hejfelix.github.io/Frase/

---
<section data-background-color="#FFFFFF" data-background-iframe="https://hejfelix.github.io/Frase/" data-background-interactive >
</section>
---
