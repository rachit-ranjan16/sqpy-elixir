# SqPy
### Lucas Square Pyramid Problem using Actor Model 

#### Description 
- Find perfect squares that are sums of consecutive
squares. 
  - Examples
    - 3<sup>2</sup> + 4<sup>2</sup> = 5<sup>2</sup>
    - 1<sup>2</sup> + 2<sup>2</sup> + 3<sup>2</sup> + <sup>2</sup> ... + 24<sup>2</sup> = 70<sup>2</sup>
- The Project Aims to use Elixir and the actor model to build a
good solution to this problem that runs well on multi-core machines.

### Group Members 
- Rachit Ranjan
- Aditya Vashist 

## Prerequisites 
- Elixir 1.7+ Installation 

## Execution Instructions 
- Navigate to sqpy
- Execute the following with integers substituted for N and k  
  - mix run 
  - mix escript.bulid
  - ./sqpy N k 
- Run Unit Tests 
  - mix test
  
- Parent thread will print N,k. Actors will print starting index for each lucas square pyramid containing k terms
  - Sample Output
    - ![Could not display. Check util/SampleOutputCap.png](sqpy/util/SampleOutputCap.png?raw=true)

## Observations 
- **Size of Work Unit = 100000** 
  - N actors are spawned if N < WorkUnit else WorkUnit Actors are spawned
  - Each Actor sums up squares of k and sends a message to the parent if the starting index satisfies the lucas pyramid property 
- **Execution Result for N=10000 k=4**
  - ![Could not display. Check util/OutCap.png](sqpy/util/OutCap.png?raw=true)
  - Running Time on a 4 Core(2 Real + 2 Logical through Intel's Hyperthreading) = 7.686s 
  - CPU Time / Real Time = **3.30668**
- Largest Problem Solved N=10000000 k=4
  
