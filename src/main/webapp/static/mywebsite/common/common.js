/**
 * Created by jacket on 2016/4/16.
 */
/**
 * 得到课程类型
 * @param i 课程标号
 * @returns {string}
 */
function getType(i){
    var type=["其它","公共|必修","公共|选修","学科基础教育|必修","学科基础教育|选修",
        "专业|必修","专业|选修","专业|实践"];
    return type[i];
}
/**
 * 得到选择题答案
 * @param i 答案标号
 * @returns {string}
 */
function getSingleQuestionAnswer(i){
    var answer=["A","B","C","D","E","F"];
    return answer[i-1];

}
/**
 * 得到判断题答案
 * @param i 答案标号
 * @returns {string}
 */
function getTfQuestionAnswer(i){
    var answer=["对","错"];
    return answer[i-1];
}
/**
 * 得到多选题的答案
 * @param answer
 */
function getMultipleQuestionAnswer(i){

    var answer={'1':'A','2':'B','3':'C','4':'D','5':'E','6':'F'};
    var s='';
    for(var j=0;j< i.length;j++)
    s=s+answer[i.charAt(j)];
    return s;

}
/**
 * 格式化时间
 * @param format
 * @returns {*}
 */
Date.prototype.format = function(format)
{
    /*
     * format="yyyy-MM-dd hh:mm:ss";
     */
    var o = {
        "y+" : this.getYear(),
        "M+" : this.getMonth() + 1,
        "d+" : this.getDate(),
        "h+" : this.getHours(),
        "m+" : this.getMinutes(),
        "s+" : this.getSeconds(),
        "q+" : Math.floor((this.getMonth() + 3) / 3),
        "S" : this.getMilliseconds()
    }

    if (/(y+)/.test(format))
    {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4
        - RegExp.$1.length));
    }

    for (var k in o)
    {
        if (new RegExp("(" + k + ")").test(format))
        {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1
                ? o[k]
                : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}
