package com.jacket.webapp.admin.controller;

import com.github.pagehelper.PageInfo;
import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
import com.jacket.webapp.user.entity.*;
import com.jacket.webapp.user.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jacket on 2016/4/6.
 */
@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private RolePermissionService rolePermissionService;
    @Autowired
    private UserRoleService userRoleService;
    @RequestMapping(value = "listUser",method = RequestMethod.GET)
    public String listUser(){
        return "admin/user/listUser";
    }

    /**
     * 列出所有用户
     * @param pageNumber
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "listUser",method = RequestMethod.POST)
    @ResponseBody
    public PageInfo<User> listUser(int pageNumber,int pageSize){
        return userService.selectPage2(pageNumber,pageSize);
    }

    /**
     * 根据id得到用户
     * @param map
     * @return
     */
    @RequestMapping(value = "updateUser/{userId}",method = RequestMethod.GET)
    public String updateUser(ModelMap map,@PathVariable String userId){
        User user=userService.getOne(userId);
        map.put("user", user);
        map.put("roles", userRoleService.listRoleByUserId(userId));
        return "admin/user/updateUser";
    }

    /**
     * 更新用户信息
     * @param user
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "updateUser/{userId}",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> updateUser(User user,HttpSession httpSession){
        User user1=(User)httpSession.getAttribute("USER");
        user.setUpdateTime(new Date());
        user.setUpdateUser(user1.getName());
        Map<String,String> map=new HashMap<>();
        if(1==userService.update(user))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 为用户删除角色
     * @param userId
     * @param roleId
     * @return
     */
    @RequestMapping(value = "updateUser/{userId}/deleteRole",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteRole(@PathVariable String userId,String roleId){
        UserRole userRole=new UserRole();
        userRole.setRoleId(roleId);
        userRole.setUserId(userId);
        Map<String,String> map=new HashMap<>();
        if(1==userRoleService.delete(userRole))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 为用户添加角色跳转
     * @param map
     * @param userId
     * @return
     */
    @RequestMapping(value = "updateUser/{userId}/addRole",method = RequestMethod.GET)
    public String addRole(ModelMap map,@PathVariable String userId){
        User user=userService.getOne(userId);
        map.put("roles", roleService.queryAll());
        map.put("user", user);
        return "admin/user/addRole";
    }
    @RequestMapping(value = "updateUser/{userId}/addRole",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addRole(@PathVariable String userId,String roleId){
        Map<String,String> map=new HashMap<>();
        UserRole userRole=new UserRole();
        userRole.setId(new UUIDGeneratorUtils().uuid32());
        userRole.setUserId(userId);
        userRole.setRoleId(roleId);
        if(1==userRoleService.save(userRole))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }
    /**
     * 跳转到角色管理页面
     * @param map
     * @return
     */
    @RequestMapping(value = "listRole",method = RequestMethod.GET)
    public String listRole(ModelMap map){
        map.put("roles", roleService.queryAll());
        return "admin/role/listRole";
    }

    /**
     * 添加角色
     * @param role
     * @return
     */
    @RequestMapping(value = "listRole",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> listRole(Role role){
        Map<String,String> map=new HashMap<>();
        role.setId(new UUIDGeneratorUtils().uuid32());
        if(1==roleService.save(role))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 跳转到角色详细页面
     * @param map
     * @param roleId
     * @return
     */
    @RequestMapping(value = "role/{roleId}",method = RequestMethod.GET)
    public String roleDetail(ModelMap map,@PathVariable String roleId){
        map.put("role", roleService.getOne(roleId));
        map.put("permissions", rolePermissionService.listPermissionByRoleId(roleId));
        return "admin/role/roleDetail";
    }

    /**
     * 为角色删除权限
     * @param roleId
     * @param perId
     * @return
     */
    @RequestMapping(value = "role/{roleId}/deletePermission",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deletePermission(@PathVariable String roleId,String perId){
        Map<String,String> map=new HashMap<>();
        RolePermission rolePermission=new RolePermission();
        rolePermission.setPerId(perId);
        rolePermission.setRoleId(roleId);
        if(1==rolePermissionService.delete(rolePermission))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 更新角色信息
     * @param map
     * @param role
     * @return
     */
    @RequestMapping(value = "role/{roleId}",method = RequestMethod.POST)
    public String roleDetail(ModelMap map,Role role){
        if(1==roleService.update(role))
            map.put("msg","success");
        else map.put("msg","failed");
        return "admin/role/roleDetail";
    }

    /**
     * 为角色添加权限跳转
     * @param map
     * @param role
     * @return
     */
    @RequestMapping(value = "role/{roleId}/addPermission",method = RequestMethod.GET)
    public String addPermission(ModelMap map,Role role,@PathVariable String roleId){
        map.put("role", roleService.getOne(roleId));
        map.put("permissions", permissionService.queryAll());
        return "admin/role/addPermission";
    }

    /**
     * 为角色添加权限
     * @param roleId 角色id
     * @param perId 权限id
     * @return
     */
    @RequestMapping(value = "role/{roleId}/addPermission",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addPermission(@PathVariable String roleId,String perId){
        Map<String,String> map=new HashMap<>();
        RolePermission rolePermission=new RolePermission();
        rolePermission.setId(new UUIDGeneratorUtils().uuid32());
        rolePermission.setRoleId(roleId);
        rolePermission.setPerId(perId);
        if(1==rolePermissionService.save(rolePermission))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 跳转到权限管理
     * @param map
     * @return
     */
    @RequestMapping(value = "listPermission",method = RequestMethod.GET)
    public String listPermission(ModelMap map){
        map.put("permissions", permissionService.queryAll());
        return "admin/permission/listPermission";
    }

    /**
     * 添加权限
     * @param permission
     * @return
     */
    @RequestMapping(value = "listPermission",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> listPermission(Permission permission){
        Map<String,String> map=new HashMap<>();
        permission.setId(new UUIDGeneratorUtils().uuid32());
        if(1==permissionService.save(permission))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }
    @RequestMapping(value = "permission/{perId}",method = RequestMethod.GET)
    public String permissionDetail(ModelMap map,@PathVariable String perId){
        map.put("permission", permissionService.getOne(perId));
        return "admin/permission/permissionDetail";
    }

    /**
     * 更新权限
     * @param map
     * @param permission 权限实体
     * @return
     */
    @RequestMapping(value = "permission/{perId}",method = RequestMethod.POST)
    public String permissionDetail(ModelMap map,Permission permission){
        if(1==permissionService.update(permission))
            map.put("msg","success");
        else map.put("msg","failed");
        return "admin/permission/permissionDetail";
    }
}
