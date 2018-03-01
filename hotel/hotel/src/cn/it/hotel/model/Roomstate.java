package cn.it.hotel.model;

/**
 * Roomstate entity. @author MyEclipse Persistence Tools
 */

public class Roomstate implements java.io.Serializable {

	// Fields

	private Integer rsid;
	private String rsname;


	@Override
	public String toString() {
		return "Roomstate [rsid=" + rsid + ", rsname=" + rsname + "]";
	}

	/** default constructor */
	public Roomstate() {
	}

	/** full constructor */
	public Roomstate(Integer rsid,String rsname) {
		this.rsid=rsid;
		this.rsname = rsname;
	}

	// Property accessors

	public Integer getRsid() {
		return this.rsid;
	}

	public void setRsid(Integer rsid) {
		this.rsid = rsid;
	}

	public String getRsname() {
		return this.rsname;
	}

	public void setRsname(String rsname) {
		this.rsname = rsname;
	}

}