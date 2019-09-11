# FPGA_UNDERWAY_SALES_MACHINE
这是东南大学信息科学与工程学院19-20-1学期(大三短学期)的FPGA课程设计，我们要做一个地铁售票机   

--  乔竞 04017437 王宸 04017404
# 要求

项目同时使用 Verilog 和 VHDL 两种语言，其中一部分模块用 Verilog 写， 另一些用 VHDL 写，然后学会用 VHDL 调用 Verilog， Verilog 调用 VHDL。

![Verilog 和 VHDL 我全都要](https://github.com/scp10086/FPGA_UNDERWAY_SALES_MACHINE/blob/master/PICTURE/timg.gif)

使用python写csv到coe文件的转换脚本(先用excel转换成csv)，完成一个简单的ROM

使用C语言写一个IP核帮助查找ROM

(特别感谢LABVIEW俱乐部技术总监陈欣玥06A17310的指导)

(先是票价，再放图片，最后放数字和汉字，可以考虑将每一站的名字都显示一下)

### 站在巨人的肩膀上

对学长的代码进行封装和调用，在此基础上写一个自己的IP核

# 教程

创建工程 选择 Family : Artix-7  Package : csg324 Speed : -1 然后选择有100t的那个

教程1 [点亮两个发光二极管](http://www.digilent.com.cn/community/174.html)

教程2 [vivado 烧写bin格式文件到 flash 中](http://bbs.elecfans.com/jishu_1566385_1_1.html) 

对于Nexys4 DDR这块板子，选择的 flash 是 

**s25fl128sxxxxxx0-spi-x1_x2_x4**

教程3 [关于vivado的约束文件怎么写](https://wenku.baidu.com/view/2ec43571844769eae009ed91.html)

教程4 [VHDL顶层调用Verilog模块](https://blog.csdn.net/gududeyhc/article/details/8795193)

教程5 [在verilog中调用VHDL模块](https://www.cnblogs.com/chengqi521/p/6514627.html)

教程6 [简单的状态机](https://wenku.baidu.com/view/28fd4333a32d7375a41780e7.html)

教程7 [调用模块](https://blog.csdn.net/qq_38628290/article/details/83788000)

教程8 [VHDL读写txt文件](http://bbs.eeworld.com.cn/thread-365624-1-1.html)

教程9  [VHDL例化](https://wenku.baidu.com/view/896a26a00029bd64783e2cbf.html)

教程10 [Verilog例化](https://blog.csdn.net/ffdia/article/details/84579670)

教程11 [按键消抖](https://www.jianshu.com/p/565896d5dcbb)
                (https://wenku.baidu.com/view/bf75aa87b9d528ea81c77944.html)

教程12 [VGA显示静态图片](https://www.cnblogs.com/ninghechuan/p/7260383.html)

教程13 [.coe文件](https://blog.csdn.net/u012081364/article/details/80349576)

教程14 [python读取csv](https://blog.csdn.net/u011089523/article/details/52859371)

教程15 [python改变图片大小](https://blog.csdn.net/weixin_43249191/article/details/84073296)

教程16 [python操作图片像素](https://www.cnblogs.com/brillant-ordinary/p/9558089.html)


# 问题

1. 如何深入了解VHDL
2. 如何写testbench
   1. 语法规则
   2. vivado GUI
5. 写项目书

# 资源

Nexys4 DDR [官网](https://reference.digilentinc.com/reference/programmable-logic/nexys-4-ddr/start)

[如何使用官网上的教程](https://reference.digilentinc.com/learn/programmable-logic/tutorials/github-demos/start)

FPGA入门与提高 [CSDN网页](https://blog.csdn.net/Pieces_thinking/article/details/90183507)

04016613裘文成学长的仓库 [18-19-3学期的计算机组织与结构（双语）II课程的FPGA作业](https://github.com/Quzard/COA2_FPGA)

04016613裘文成学长的仓库 [东南大学信息学院大三短学期FPGA课程设计——售货机](https://github.com/Quzard/FPGA_Vending_Machine)

不知道是哪位学长写好的 [地铁售票系统计划书](https://max.book118.com/html/2017/0705/120448514.shtm)

VHDL 的textio package [VHDL各种包](https://www.csee.umbc.edu/portal/help/VHDL/stdpkg.html)

library STD;

use STD.textio.all;

# 各种报错的解决方法

1. [no constraints for the design](https://forums.xilinx.com/t5/Implementation/Vivado-warning-Constraints-18-5210-No-constraints-selected-for/td-p/930337)

2. [verilog 将output变成reg的警告消除](https://electronics.stackexchange.com/questions/208984/verilog-how-to-avoid-redeclaration-of-ansi-port)

3. [multi driven net](https://forums.xilinx.com/t5/Welcome-Join/Error-Multi-driver-net-found-in-the-design/td-p/550090)

4. [真 multi driven net解决方案](https://forums.xilinx.com/t5/Synthesis/Synth-8-6859-multi-driven-net-on-pin-output-error/m-p/952277#M30421)

# 重点难题的解决方案（王宸TQL）

原始方案一（难度较大） 我们将找到的南京地铁票价的excel表格导出到SD卡里，然后用VHDL读取SD卡的数据。

改进方案二（有一定难度）用显示照片的思想，将excel中的数据写到.coe文件里。

# 经验总结

1. 如果遇到玄学报错，记得要新建一个工程，最小化模块，开始测试

2. 别在神志不清的时候写FPGA，我TM写一个testbench 竟然写了一个下午，一开始以为是我的vivado的仿真器有问题，因为我看那个TCL console 最上面一直有红色的报错，查了半天也没查出什么结果，一怒之下新建了一个工程，重新写rom的testbench结果还有那个红色报错，我内心就很不爽，随手打了 clc 和 clear ，当然这是TCL不支持的命令，我又综合了一次,结果TCL之前的clc和clear的报错一直没有消失，我才明白我运行的仿真现在根本没有报错，之后我又怀疑 

always #10 clk=~clk

这句话根本没有翻转时钟，就会换成了

initial

begin

#10;

clk=~clk;

#10;

clk=~clk;

end

结果呢，卧槽真的成功了，哪里都没有错，我一个下午就这么过去了！哭了。

![romtestbench](https://github.com/scp10086/FPGA_UNDERWAY_SALES_MACHINE/blob/master/PICTURE/rom.jpg)

啊啊。后来我发现

always #10 clk=~clk

这句话因该放在endmodule之前。

3. 对不起，我不知道FPGA的BRAM很小，之前想放一张800* 600的照片，结果BRAM无法生成，只好阉割了成640 * 480的分辨率。

4. 对不起，我本来想640 * 480 60fps 显示图片，这样的时钟频率为25.175Mhz ，然而时钟分频只能到25.173Mhz，这就导致图片只能显示一点点。

# 我们做了什么

1. 写了一个7段显示数码管的IP核

