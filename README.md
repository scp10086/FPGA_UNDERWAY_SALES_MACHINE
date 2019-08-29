# FPGA_UNDERWAY_SALES_MACHINE
这是东南大学信息科学与工程学院19-20-1学期(大三短学期)的FPGA课程设计，我们要做一个地铁售票机   

--  乔竞 04017437 王宸 04017404
# 要求

项目同时使用 Verilog 和 VHDL 两种语言，其中一部分模块用 Verilog 写， 另一些用 VHDL 写，然后学会用 VHDL 调用 Verilog， Verilog 调用 VHDL。

![Verilog 和 VHDL 我全都要](https://github.com/scp10086/FPGA_UNDERWAY_SALES_MACHINE/blob/master/PICTURE/timg.gif)

### 站在巨人的肩膀上

对学长的代码进行封装和调用，在此基础上写一个自己的IP核

# 教程

创建工程 选择 Family : Artix-7  Package : csg324 Speed : -1 然后选择有100t的那个

教程1 [点亮两个发光二极管](http://www.digilent.com.cn/community/174.html)

教程2 [vivado 烧写bin格式文件到 flash 中](http://bbs.elecfans.com/jishu_1566385_1_1.html) 

对于Nexys4 DDR这块板子，选择的 flash 是 

**s25fl128sxxxxxx0-spi-x1_x2_x4**

教程3 [关于vivado的约束文件怎么写](https://wenku.baidu.com/view/2ec43571844769eae009ed91.html)

# 问题

1. 如何写约束文件
   1. 语法规则
   2. vivado GUI
2. 如何写testbench
3. 如何深入了解VHDL
4. 如何写VGA的VHDL代码
5. 写项目书
6. 找到大量的教程和案例
    1. 想办法找到NEXYS4 DDR 板子一开始的那个例程
7. IP核
8. 时钟树
# 资源

Nexys4 DDR [官网](https://reference.digilentinc.com/reference/programmable-logic/nexys-4-ddr/start)

FPGA入门与提高 [CSDN网页](https://blog.csdn.net/Pieces_thinking/article/details/90183507)

04016613裘文成学长的仓库 [18-19-3学期的计算机组织与结构（双语）II课程的FPGA作业](https://github.com/Quzard/COA2_FPGA)

04016613裘文成学长的仓库 [东南大学信息学院大三短学期FPGA课程设计——售货机](https://github.com/Quzard/FPGA_Vending_Machine)

不知道是哪位学长写好的 [地铁售票系统计划书](https://max.book118.com/html/2017/0705/120448514.shtm)
