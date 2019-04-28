//
//  NineBigSort.h
//  NineBigSort
//
//  Created by 康永帅 on 15/7/29.
//  Copyright (c) 2015年 Liu Dehua. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 int  array[] = {12, 14, 54, 5, 6, 3, 9, 8, 47, 89, -1};
 for (int i=0; i< 10; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 //1.冒泡排序
 if (indexPath.section==0) {
 if (indexPath.row==0) {
 printf("冒泡排序：");
 bubbleSort(array, 10);
 for (int i=0; i < 10; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 }else if (indexPath.row==1) {
 printf("改进冒泡排序：");
 improvedBubbleSort(array, 10);
 for (int i=0; i < 10; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 }
 //2.插入排序
 }else if (indexPath.section==1) {
 if (indexPath.row==0) {
 printf("插入排序：");
 insertSort(array, 10);
 for (int i=0; i < 10; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 }else if (indexPath.row==1) {
 
 }
 //3.选择排序
 }else if (indexPath.section==2) {
 if (indexPath.row==0) {
 printf("选择排序：");
 sectionSort(array, 10);
 for (int i=0; i < 10; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 }else if (indexPath.row==1) {
 
 }
 //4.归并排序
 }else if (indexPath.section==3) {
 if (indexPath.row==0) {
 int p[10];
 printf("归并排序：");
 mergeSort(array, 0, 9, p);
 for (int i=0; i < 10; i++)
 {
 printf("%d ", p[i]);
 }
 printf("\n");
 }else if (indexPath.row==1) {
 
 }
 //5.归并排序
 }else if (indexPath.section==4) {
 if (indexPath.row==0) {
 printf("归并排序：");
 quickSort(array, 0, 9);
 for (int i=0; i < 10; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 }else if (indexPath.row==1) {
 
 }
 //6.堆排序
 }else if (indexPath.section==5) {
 if (indexPath.row==0) {
 printf("创建堆：");
 createHeap(array,10);
 for (int i=0; i < 10; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 printf("删除元素：");
 int length = deleteElement(array,10);
 for (int i=0; i < length; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 printf("插入元素：");
 length = insertElement(array,length,99);
 for (int i=0; i < length; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 printf("堆排序：");
 heapSort(array, length);
 for (int i=0; i < length; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 }else if (indexPath.row==1) {
 
 }
 //7.计数排序
 }else if (indexPath.section == 6) {
 int B[10];
 printf("计数排序：");
 countSort(array, B, 10, 89);
 for (int i=0; i < 10; i++)
 {
 printf("%d ", B[i]);
 }
 printf("\n");
 //8.基数排序
 }else if (indexPath.section==7){
 
 printf("基数排序：");
 radixSort(array, 10);
 for (int i=0; i < 10; i++)
 {
 printf("%d ", array[i]);
 }
 printf("\n");
 //9.桶排序
 }else if (indexPath.section==8){
 
 //printf("桶排序：");

 桶排序是另外一种以O(n)或者接近O(n)的复杂度排序的算法.
 它假设输入的待排序元素是等可能的落在等间隔的值区间内.一
 个长度为N的数组使用桶排序, 需要长度为N的辅助数组. 等间
 隔的区间称为桶, 每个桶内落在该区间的元素. 桶排序是基数
 排序的一种归纳结果
 
 算法的主要思想: 待排序数组A[1...n]内的元素是随机分布在
 [0,1)区间内的的浮点数.辅助排序数组B[0....n-1]的每一个
 元素都连接一个链表.将A内每个元素乘以N(数组规模)取底,并以
 此为索引插入(插入排序)数组B的对应位置的连表中. 最后将所
 有的链表依次连接起来就是排序结果.
 
 这个过程可以简单的分步如下:
 
 设置一个定量的数组当作空桶子。
 寻访序列，并且把项目一个一个放到对应的桶子去。
 对每个不是空的桶子进行排序。
 从不是空的桶子里把项目再放回原来的序列中。

}
 
 
 
 */

//冒泡排序
void bubbleSort(int* array, int length);

//改进冒泡排序
void improvedBubbleSort(int* array, int length);

//插入排序
void insertSort(int* array, int length);

//选择排序
void sectionSort(int* array, int length);

//归并排序
void mergeSort(int *a, int first, int last, int *temp);

//快速排序
void quickSort(int *s, int low, int high);

//创建堆
void createHeap(int *array,int length);
//插入元素
int insertElement(int *array, int length, int element);
//删除堆元素（堆只能删除根元素）
int deleteElement(int *array, int length);
//堆排序
void heapSort(int *array ,int length);

/*计数排序的基本思想是对于给定的输入序列中的每一个元素x，确定该序列中值小于x的元素的个数。
 一旦有了这个信息，就可以将x直接存放到最终的输出序列的正确位置上。例如，如果输入序列中只
 有17个元素的值小于x的值，则x可以直接存放在输出序列的第18个位置上。当然，如果有多个元素
 具有相同的值时，我们不能将这些元素放在输出序列的同一个位置上，因此，上述方案还要作适当的
 修改。*/
void countSort(int *input, int *output, int length, int k);

/*基数排序是另外一种比较有特色的排序方式，它是怎么排序的呢？我们可以按照下面的一组数字做出说明：12、 104、 13、 7、 9
 
 （1）按个位数排序是12、13、104、7、9
 
 （2）再根据十位排序104、7、9、12、13
 
 （3）再根据百位排序7、9、12、13、104
 
 这里注意，如果在某一位的数字相同，那么排序结果要根据上一轮的数组确定，举个例子来说：07和09在十分位都是0，但是上一轮排序的时候09是排在07后面的；同样举一个例子，12和13在十分位都是1，但是由于上一轮12是排在13前面，所以在十分位排序的时候，12也要排在13前面。
 
 所以，一般来说，10基数排序的算法应该是这样的？
 
 （1）判断数据在各位的大小，排列数据；
 
 （2）根据1的结果，判断数据在十分位的大小，排列数据。如果数据在这个位置的余数相同，那么数据之间的顺序根据上一轮的排列顺序确定；
 
 （3）依次类推，继续判断数据在百分位、千分位......上面的数据重新排序，直到所有的数据在某一分位上数据都为0。*/
void radixSort(int* array, int length);
