package com.cqhot.app.util;


import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

/**
 * 发送手机短信工具类
 * @author herunchen
 * @version 创建时间：2018年12月22日 下午15:43:42
 */
public class SendSMSUtil {
	
	/**
	 * 发送短信工具
	 * @author herunchen
	 * @version 创建时间：2018年12月22日 下午15:44:20
	 * @param userNumbers 手机号
	 * @param messageContent 短信内容
	 * @return 返回成功或失败
	 */
	public static String sendMessage(String userNumbers, String messageContent) {
		String gbkUrl = "http://gbk.api.smschinese.cn";
		String uid = "herunchena";
		String key = "d41d8cd98f00b204e980";
		int statusCode = 0;
		try {
			HttpClient client = new HttpClient();
			PostMethod post = new PostMethod(gbkUrl);
			//在头文件中设置转码
			post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");
			NameValuePair[] data ={ new NameValuePair("Uid", uid),
					new NameValuePair("Key", key),
					new NameValuePair("smsMob",userNumbers),
					new NameValuePair("smsText",messageContent)};
			post.setRequestBody(data);
			client.executeMethod(post);
			statusCode = post.getStatusCode();
			System.out.println("statusCode:"+statusCode);
			String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
			//打印返回消息状态
			System.out.println(result); 
			post.releaseConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return statusCode+"";
	}
	
	public static void main(String[] args) {
		//String str = "尊敬的用户，您的密码已修改，如果不是您本人所为，请联系管理员";
		//SendSMSUtil.sendMessage("15178701739",str);
	}
}
