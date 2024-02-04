计算机组成原理笔记
1.数字逻辑基础
数字逻辑部件分为2类，第一是组合逻辑，该类不包括存储器；第二是状态逻辑（时序逻辑），该类含有存储器，至少有两个输入：时钟、待写入的数据，以及一个输出，存储的数据。

只有在时钟信号的上升沿，才允许向状态单元（PC,IR,PCB都属于是状态单元）写入数据。

这样的时钟方法叫做边沿触发的时钟。

MUX（Multiplex）（多选器）从多个数据中选择一个作为输出，选择哪个信号取决于选择控制信号。

总线（bus），这里的总线概念与常见的不一致，表示数据信息多于一位的信号线，在数字信号电路中加粗表示并标记位宽。

2.MIPS核心子集
R型指令：add，sub，AND，OR，slt
访存指令：lw、sw
决策指令：beq，j

一条MIPS指令的执行分为5个阶段，统称为一个指令周期。
①IF取指令：根据PC提供的地址，从存储器中取出指令。                   instruction fetch
②指令译码与读寄存器：分析指令字段，读取1个或2个寄存器。
③EX运算：ALU运算R型指令的结果/访存指令的地址/beq两源操作数是否相等
④MEM访存与分支：访存指令向存储器进行读写，分支指令完成分支
⑤WB写回：将结果送回寄存器

3.数据通路概图

4.数据通路部件：取指令周期IF

根据PC所给地址，从存储器中取出指令

存储器中的指令和数据分开看待，分为指令存储器和数据存储器，有的存储器存储的是指令，有的是数据。

指令存储器存放程序的指令，输入一个地址时输出其指向的指令。

程序计数器保存当前指令的地址。

将一个ALU用作加法器（Add），用来计算PC+4，即下一条指令的地址



5.数据通路部件：译码与读寄存器周期ID

分析指令字段，读取一个或两个寄存器

寄存器堆含有32个通用寄存器

对应R型指令的三操作数格式，寄存器堆接收3个寄存器编号，其中至多2个用来读（R型和beq读2个，sw读一个），至多1个用来写（R型写回rd位置，lw写回rt位置）

外部读取寄存器时，输出rs和rt寄存器中的数据

为了支持写入数据，需要一个32位的写数据端口作为输入

访存（访问内存）指令中的16位偏移量(立即数)和beq中的相对地址需要经符号扩展（sign-extend）逻辑扩充到32位
比如（lw/sw $t1 10($t3)）中的偏移量是16位,$t3地址是32位，那么往前扩展16位，正数扩0，负数扩1，然后才能和$t3的地址位数一样来相加。
beq指令，指向的地址是一个字地址，要先符号扩展，再移位2位转化为字节地址

                            

6.数据通路部件：运算周期EX

EX运算：ALU运算R型指令的结果/访存指令的地址/beq两源操作数是否相等

对于R型指令，ALU执行相应的算数/逻辑运算，并输出结果，下图左1，输入两个寄存器的数rs、rt
对于访存指令，ALU计算基地址和偏移量的和，得到数据的真正地址，下图左2，输入一个寄存器的数rs，另外一个32位数
对于分支指令，ALU将两源操作数相减，根据结果是否为0，判断两数是否相等

对于分支指令，其中的地址位是字地址，左移2位得到字节地址，然后+当前地址（PC寄存器中的地址）+4（当前寄存器下一条地址的起始地址），所以分支指令也需要一个加法器来进行该加法计算。

    

7.数据通路部件：访存与分支周期MEM、写回周期WB

MEM访存分支：访存指令向存储器进行读写，分支指令完成分支
WB写回：将结果送回某寄存器

访存指令在第四阶段才真正读/写数据存储器
ALU计算基址和偏移量的和，得到真正地址并输入数据存储器
LW从数据存储器读取数据并输出，SW向数据存储器写入数据

beq分支指令在这个阶段不访存，但会将PC+4（下一条指令地址）/分支目标地址（可能要分支的地址 ）写回PC，决定分支是否发生


R型指令将运算结果写回rd寄存器
lw指令将存储器数据写回rt寄存器

8.MIPS核心子集数据通路


理解：首先，下一条指令的地址存储在PC中，从PC开出2条路，先看第1条，去到指令存储器，根据指令地址找到指令并输出。
接下来分析指令，一般来说，指令中包含rs，rt，rd三个部分，rs和rt中的1个或2个用来读取，rd用来写入，





