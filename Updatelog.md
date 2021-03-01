### Aerodynamics Parameter Quarter System(APQS) Update Log

> Application Name: 空气动力学常用参数计算查询系统（APQS）
>
> Author Name: 张卓立 王慕尧
>
> Email: jonny@mail.nwpu.edu.cn
>
> ​			739544718@qq.com
>
> University: Northwestern Polytechnical University
>
> Summary: 用于快捷查询正斜激波相关数值并绘图可视化
>
> Last Updated Date:  2021.3.1



###### APQS 21w04a1 Release-notes:

---

**时间**：2021.1.28

**变化**：

+ 构件GUI框架，排布布局



###### APQS 21w04a2 Release-notes:

---

**时间**：2021.1.29

**变化**：

+ 加入计算正激波函数
+ 加入绘制正激波图像函数



###### APQS 21w08a1 Release-notes:

---

**时间**：2021.2.23

**变化**：

+ 融合计算函数到GUI中，可初步计算正激波相关数值
+ 融合画图功能到GUI中，可通过按键`-`和`=`进行切换图片
+ 加入数值输入查错，通过警告窗口阻止输入



###### APQS 21w08b1 Release-notes:

---

**时间**：2021.2.24

**修复**：

+ 多次点击绘图导致图层叠加的bug
+ 未点击绘图时按键`-`或`=`导致程序报错的bug
+ 使用方向键切换输入时图像变动的错误

###### APQS 21w08a2 Release-notes:

---

**时间**：2021.2.26

**变化**：

+ 增加斜激波图像显示
+ 优化图像切换卡顿问题
+ 加入退出选项，并会在关闭窗口时提醒是否确认此操作
+ 切换正斜激波的同时，图像对应进行变换
+ 增加鼠标选择图像点时变为手型
+ 增加图上选点并显示（仅正激波）
+ 增加插值函数，对用户输入进行近似输出

###### APQS 21w08b2 Release-notes:

---

**时间**：2021.2.28

**修复**：

+ 在切换图像后用户此前选择的点重复出现的bug

**时间**：2021.3.1

**修复**：

+ 无法标记斜激波图像所有线上点的bug
+ 在斜激波游动鼠标时报错的bug
+ 重构斜激波画图的代码，增强选点的可拓展性。