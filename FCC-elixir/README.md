# Learn Elixir

> Source: [FreeCodeCamp Elixir video](https://www.youtube.com/watch?v=IiIgm_yaoOA&t=225s)

> Local source: [FCC ELixir video](~/Movies/Tutorial/Functional Programming with Elixir – Full Course ( 1080 X 1728 60fps ).mp4)


### Actor Model
In simple words, isolated computing system. 

- Processes: 
   - Actor run inside processes
   - Processes are identified by PID
   - Inter-communication by Message Passing
   - Each processes has it's Stack & Heap allocation

- Work
   - Receive message in mailbox
   - Executed FIFO
   - very cheap to create < 3k of memory
   - communicate with message passing

