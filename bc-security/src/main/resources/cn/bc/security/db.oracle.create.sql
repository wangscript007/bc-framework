-- COMMENT ON COLUMN . IS '';
-- 系统安全相关模块
-- 模块
create table BC_SECURITY_MODULE (
    ID number(19) NOT NULL,
    UID_ varchar(36),
    TYPE_ number(1) NOT NULL,
    STATUS_ number(1) NOT NULL,
    INNER_ number(1) NOT NULL,
    BELONG number(19),
    CODE varchar(100) NOT NULL,
    NAME varchar(255) NOT NULL,
    URL varchar(255),
    OPTION_ nvarchar2(1000),
    primary key (ID)
);
COMMENT ON TABLE BC_SECURITY_MODULE IS '模块';
COMMENT ON COLUMN BC_SECURITY_MODULE.UID_ IS '全局标识';
COMMENT ON COLUMN BC_SECURITY_MODULE.TYPE_ IS '类型：1-文件夹,2-内部链接,3-外部链接,4-html';
COMMENT ON COLUMN BC_SECURITY_MODULE.STATUS_ IS '状态：0-已禁用,1-启用中,2-已删除';
COMMENT ON COLUMN BC_SECURITY_MODULE.INNER_ IS '是否为内置对象:0-否,1-是';
COMMENT ON COLUMN BC_SECURITY_MODULE.BELONG IS '所隶属的模块';
COMMENT ON COLUMN BC_SECURITY_MODULE.CODE IS '编码，兼排序作用';
COMMENT ON COLUMN BC_SECURITY_MODULE.NAME IS '名称';
COMMENT ON COLUMN BC_SECURITY_MODULE.URL IS '地址';
COMMENT ON COLUMN BC_SECURITY_MODULE.OPTION_ IS '扩展参数';

-- 角色
create table BC_SECURITY_ROLE (
    ID number(19) NOT NULL,
    UID_ varchar(36),
    TYPE_ number(1) NOT NULL,
    STATUS_ number(1) NOT NULL,
    INNER_ number(1) NOT NULL,
    CODE varchar(100) NOT NULL,
    NAME varchar(255) NOT NULL,
    primary key (ID)
);
COMMENT ON TABLE BC_SECURITY_ROLE IS '角色';
COMMENT ON COLUMN BC_SECURITY_ROLE.UID_ IS '全局标识';
COMMENT ON COLUMN BC_SECURITY_ROLE.TYPE_ IS '类型';
COMMENT ON COLUMN BC_SECURITY_ROLE.STATUS_ IS '状态：0-已禁用,1-启用中,2-已删除';
COMMENT ON COLUMN BC_SECURITY_ROLE.INNER_ IS '是否为内置对象:0-否,1-是';
COMMENT ON COLUMN BC_SECURITY_ROLE.CODE IS '编码，兼排序作用';
COMMENT ON COLUMN BC_SECURITY_ROLE.NAME IS '名称';

-- 角色与模块的关联
create table BC_SECURITY_ROLE_MODULE (
    RID number(19) NOT NULL,
    MID number(19) NOT NULL,
    primary key (RID,MID)
);
COMMENT ON TABLE BC_SECURITY_ROLE_MODULE IS '角色与模块的关联：角色可以使用哪些模块资源';
COMMENT ON COLUMN BC_SECURITY_ROLE_MODULE.RID IS '角色ID';
COMMENT ON COLUMN BC_SECURITY_ROLE_MODULE.MID IS '模块ID';
ALTER TABLE BC_SECURITY_ROLE_MODULE ADD CONSTRAINT FK_RM_ROLE FOREIGN KEY (RID) 
	REFERENCES BC_SECURITY_ROLE (ID);
ALTER TABLE BC_SECURITY_ROLE_MODULE ADD CONSTRAINT FK_RM_MODULE FOREIGN KEY (MID) 
	REFERENCES BC_SECURITY_MODULE (ID);
