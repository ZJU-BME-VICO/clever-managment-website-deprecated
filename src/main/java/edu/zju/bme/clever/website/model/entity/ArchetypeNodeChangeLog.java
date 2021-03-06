package edu.zju.bme.clever.website.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "ARCHETYPE_NODE_CHANGE_LOG")
@DynamicUpdate(true)
public class ArchetypeNodeChangeLog {

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	@Column(name = "PREVIOUS_NODE_NAME")
	private String previousNodeName;
	@Column(name = "CURRENT_NODE_NAME")
	private String currentNodeName;
	@Column(name = "PREVIOUS_VERSION")
	private String previousVersion;
	@Column(name = "CURRENT_VERSION")
	private String currentVersion;
	@Column(name = "RM_TYPE")
	private String rmType;
	@Column(name = "NODE_PATH")
	private String nodePath;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ARCHETYPE_HOST_ID")
	private ArchetypeHost archetypeHost;
	@Column(name = "ARCHETYPE_HOST_ID", updatable = false, insertable = false)
	private Integer archetypeHostId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPreviousNodeName() {
		return previousNodeName;
	}

	public void setPreviousNodeName(String previousNodeName) {
		this.previousNodeName = previousNodeName;
	}

	public String getCurrentNodeName() {
		return currentNodeName;
	}

	public void setCurrentNodeName(String currentNodeName) {
		this.currentNodeName = currentNodeName;
	}

	public String getPreviousVersion() {
		return previousVersion;
	}

	public void setPreviousVersion(String previousVersion) {
		this.previousVersion = previousVersion;
	}

	public String getCurrentVersion() {
		return currentVersion;
	}

	public void setCurrentVersion(String currentVersion) {
		this.currentVersion = currentVersion;
	}

	public String getRmType() {
		return rmType;
	}

	public void setRmType(String rmType) {
		this.rmType = rmType;
	}

	public ArchetypeHost getArchetypeHost() {
		return archetypeHost;
	}

	public void setArchetypeHost(ArchetypeHost archetypeHost) {
		this.archetypeHost = archetypeHost;
	}

	public String getNodePath() {
		return nodePath;
	}

	public void setNodePath(String nodePath) {
		this.nodePath = nodePath;
	}

	public Integer getArchetypeHostId() {
		return archetypeHostId;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof ArchetypeNodeChangeLog) {
			return ((ArchetypeNodeChangeLog) obj).getId() == this.id;
		}
		return false;
	}
}
