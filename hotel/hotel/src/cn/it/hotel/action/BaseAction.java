package cn.it.hotel.action;

import java.io.InputStream;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.hotel.model.Roomstate;
import cn.it.hotel.service.BusinessService;
import cn.it.hotel.service.ClientService;
import cn.it.hotel.service.RoomService;
import cn.it.hotel.service.RoomcategoryService;
import cn.it.hotel.service.RoomstateService;
import cn.it.hotel.service.UserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * Struts执行流程：先创建Action，再调用拦截器，拦截器访问成功过条用Action的方法
 * 
 * (在项目启动时Struts的过滤器，已经把相应的内置对象对应的Map存储到了ActionContext和值栈中)
 * 如果实现了相应的****Aware接口，就会从ActionContext中取得相应的Map进行传入，实现的拦截器为servletConfig
 * @author Administrator
 *
 */

@Controller //不写名字默认是类名中的第一个字母小写 即：baseAction
@Scope("prototype")
public class BaseAction<T> extends ActionSupport  implements RequestAware,SessionAware,ApplicationAware,ModelDriven<T> {

	protected T model;
	
	//获取要删除的id
	protected String rcids;
	protected String uids;
	protected String rsids;
	protected String rids;
	protected String cids;
	protected String nowUserUid;
	protected String bremark;
	

	//保存登录的用户名和密码
	protected String user;
	protected String pass;
	//添加用户时验证用户名
	protected String userUlogin;
	//修改用户密码时验证原密码是否正确
	protected String userUpass;
	
	protected Integer page;
	
	protected Integer rows;
	
	protected Roomstate roomstate1 =new Roomstate(1, "空");
	protected Roomstate roomstate2 =new Roomstate(2, "已预订");
	protected Roomstate roomstate3 =new Roomstate(3, "已入住");

	protected InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	protected List<T> jsonList=null;
	
	public List<T> getJsonList() {
		return jsonList;
	}

	protected Map<String, Object> pageMap=null;
	
	public Map<String, Object> getPageMap() {
		return pageMap;
	}
	
	@Resource
	protected RoomcategoryService roomcategoryService;
	@Resource
	protected RoomstateService roomstateService;
	@Resource
	protected RoomService roomService;
	@Resource
	protected UserService userService;
	@Resource
	protected ClientService clientService;
	@Resource
	protected BusinessService businessService;
    
	protected Map<String, Object> request;
	protected Map<String, Object> session;
	protected Map<String, Object> application;
	
	public T getModel() {
		ParameterizedType type=(ParameterizedType)this.getClass().getGenericSuperclass();
		Class clazz=(Class)type.getActualTypeArguments()[0];
		try {
			model=(T)clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return model;
	}
	
	
	@Override
	public void setApplication(Map<String, Object> application) {
		// TODO Auto-generated method stub
		this.application=application;
	}
	@Override
	public void setRequest(Map<String, Object> request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	public String getRcids() {
		return rcids;
	}

	public void setRcids(String rcids) {
		this.rcids = rcids;
	}

	public String getCids() {
		return cids;
	}

	public void setCids(String cids) {
		this.cids = cids;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}


	public String getRsids() {
		return rsids;
	}

	public void setRsids(String rsids) {
		this.rsids = rsids;
	}

	public String getRids() {
		return rids;
	}

	public void setRids(String rids) {
		this.rids = rids;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}
	
	public String getNowUserUid() {
		return nowUserUid;
	}

	public void setNowUserUid(String nowUserUid) {
		this.nowUserUid = nowUserUid;
	}
	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getUserUlogin() {
		return userUlogin;
	}

	public void setUserUlogin(String userUlogin) {
		this.userUlogin = userUlogin;
	}

	public String getUserUpass() {
		return userUpass;
	}

	public void setUserUpass(String userUpass) {
		this.userUpass = userUpass;
	}


	public String getBremark() {
		return bremark;
	}


	public void setBremark(String bremark) {
		this.bremark = bremark;
	}
		
	
}
