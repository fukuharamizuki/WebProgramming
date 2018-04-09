package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.Common;
import model.User;

public class UserDao {

	public User findByLoginInfo(String loginId, String password) {

        Connection conn = null;
        try {
            conn = DBManager.getConnection();

            String sql = "SELECT * FROM user WHERE login_id = ? and password = ?";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, loginId);
            pStmt.setString(2, Common.password(password));
            ResultSet rs = pStmt.executeQuery();

            if (!rs.next()) {
                return null;
            }

            String loginIdData = rs.getString("login_id");
            String nameData = rs.getString("name");
            return new User(loginIdData, nameData);

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {

            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
    }


    public List<User> findAll() {
        Connection conn = null;
        List<User> userList = new ArrayList<User>();

        try {

            conn = DBManager.getConnection();

            String sql = "SELECT * FROM user where login_id not in ('admin')";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String loginId = rs.getString("login_id");
                String name = rs.getString("name");
                Date birthDate = rs.getDate("birth_date");
                String password = rs.getString("password");
                String createDate = rs.getString("create_date");
                String updateDate = rs.getString("update_date");
                User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {

            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return userList;
    }

    public static void registrationUser(String loginId, String password, String password2, String name,
			String birthDate) {

		Connection conn = null;

		try {
			conn = DBManager.getConnection();

			String sql ="INSERT INTO user(login_id,name,birth_date,password,create_date, update_date) VALUES(?,?,?,?,now(),now())";

			PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, loginId);
            pStmt.setString(2, name);
            pStmt.setString(3, birthDate);
            pStmt.setString(4, Common.password(password));
            pStmt.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {
				try {
					conn.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
    }

    public User findDate(int id) {
        Connection conn = null;
        List<User> userList = new ArrayList<User>();

        try {
            conn = DBManager.getConnection();

            String sql = "SELECT * FROM user WHERE id = ?";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1,id);
            ResultSet rs = pStmt.executeQuery();

            while (rs.next()) {
                int id2 = rs.getInt("id");
                String loginId = rs.getString("login_id");
                String name = rs.getString("name");
                Date birthDate = rs.getDate("birth_date");
                String password = rs.getString("password");
                String createDate = rs.getString("create_date");
                String updateDate = rs.getString("update_date");
                User user = new User(id2, loginId, name, birthDate, password, createDate, updateDate);
                return user;

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return null;
    }

    public User upDate(int id) {
        Connection conn = null;
        List<User> userList = new ArrayList<User>();

        try {
            conn = DBManager.getConnection();

            String sql = "SELECT * FROM user WHERE id = ?";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1,id);
            ResultSet rs = pStmt.executeQuery();

            while (rs.next()) {
                int id2 = rs.getInt("id");
                String loginId = rs.getString("login_id");
                String name = rs.getString("name");
                Date birthDate = rs.getDate("birth_date");
                String password = rs.getString("password");
                String createDate = rs.getString("create_date");
                String updateDate = rs.getString("update_date");
                User user = new User(id2, loginId, name, birthDate, password, createDate, updateDate);
                return user;

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return null;
    }

    public static void updateUser(int id,String loginId, String password, String password2, String name,
			String birthDate) {

		Connection conn = null;

		try {
			conn = DBManager.getConnection();

			String sql ="UPDATE user SET login_id = ?,name = ?,birth_date = ?,password = ?,update_date = now() WHERE id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, loginId);
            pStmt.setString(2, name);
            pStmt.setString(3, birthDate);
            pStmt.setString(4, Common.password(password));
            pStmt.setInt(5, id);
            pStmt.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {
				try {
					conn.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
    }

    public User Delete(int id) {
        Connection conn = null;
        List<User> userList = new ArrayList<User>();

        try {
            conn = DBManager.getConnection();

            String sql = "DELETE FROM user WHERE id = ?";

            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1,id);
            pStmt.executeUpdate();

            return null;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
    }

    public List<User> find(String loginId1,String name1,String birthDate1,String birthDate2) {
        Connection conn = null;
        List<User> userList = new ArrayList<User>();

        try {

            conn = DBManager.getConnection();

            String sql = "SELECT * FROM user where login_id not in ('admin')";

            if(!loginId1.equals("")) {
            		sql += " and login_id = '" + loginId1 + "'";
            }
            if(!name1.equals("")) {
            		sql += " and name like '%" + name1 + "%' ";
            }
            if(!birthDate1.equals("") && !birthDate2.equals("")) {
            		sql += " and birth_date >= '" + birthDate1 + "' and birth_date < '" + birthDate2 + "'";
            }

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String loginId = rs.getString("login_id");
                String name = rs.getString("name");
                Date birthDate = rs.getDate("birth_date");
                String password = rs.getString("password");
                String createDate = rs.getString("create_date");
                String updateDate = rs.getString("update_date");
                User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {

            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return userList;
    }

    public static String findLoginId(String loginId) {
    		Connection conn = null;

    		try {
    			conn = DBManager.getConnection();
    			String sql = "SELECT login_id FROM user ";

    			Statement stmt = conn.createStatement();
    			ResultSet rs = stmt.executeQuery(sql);

    			return loginId;

    		}catch(SQLException e) {
    			e.printStackTrace();
    			return null;
    		}finally {
    			if(conn != null) {
    				try {
    					conn.close();
    				}catch(SQLException e) {
    					e.printStackTrace();
    					return null;
    				}
    			}
    		}
    }

//    public List<User> find(String loginId1,String name1,String birthDate1,String birthDate2) {
//        Connection conn = null;
//        List<User> userList = new ArrayList<User>();
//
//        try {
//
//            conn = DBManager.getConnection();
//
//            String sql = "SELECT * FROM user WHERE login_id=? AND name=? AND birth_date=? AND birth_date=?";
//
//            PreparedStatement pStmt = conn.prepareStatement(sql);
//            pStmt.setString(1, loginId1);
//            pStmt.setString(2, name1);
//            pStmt.setString(3, birthDate1);
//            pStmt.setString(4, birthDate2);
//
//            ResultSet rs = pStmt.executeQuery();
//
//            while (rs.next()) {
//                int id = rs.getInt("id");
//                String loginId = rs.getString("login_id");
//                String name = rs.getString("name");
//                Date birthDate = rs.getDate("birth_date");
//                String password = rs.getString("password");
//                String createDate = rs.getString("create_date");
//                String updateDate = rs.getString("update_date");
//                User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);
//
//                userList.add(user);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return null;
//        } finally {
//
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                    return null;
//                }
//            }
//        }
//        return userList;
//    }


}
