package DAO;

import Entity.ChatEntity;
import Page.ChatPage;
import Util.HibernateUtils;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

public class ChatDao {

    public boolean isOk(ChatPage chatPage) {
        boolean flag = false;
        if (chatPage.getId() != null) {
            ChatPage chatPage1 = GetById(chatPage.getId());
            if (chatPage == null) flag = false;
            else flag = true;
        }
        return flag;
    }

    public boolean Add(ChatPage chatPage) {//添加相关的记录
        boolean flag = false;
        Session session = null;
        if (isOk(chatPage))
            return flag;
        try {
            session = HibernateUtils.getSession();
            session.beginTransaction();

            ChatEntity chatEntity = new ChatEntity();

            chatEntity.setContent(chatPage.getContent());
            chatEntity.setCourseid(chatPage.getCourseid());
            chatEntity.setStatus(chatPage.getStatus());
            chatEntity.setStudentid(chatPage.getStudentid());
            chatEntity.setTime(chatPage.getTime());
            chatEntity.setTitle(chatPage.getTitle());
            /*BeanUtils.copyProperties(studentPage, studentEntity);*/
            session.save(chatEntity);
            session.getTransaction().commit();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            flag = false;
        } finally {
            HibernateUtils.closeSession(session);
        }
        return flag;
    }


    public boolean Del(ChatPage chatPage) {

        boolean flag = false;
        if (isOk(chatPage)) {
            Session session = null;
            try {
                session = HibernateUtils.getSession();
                session.beginTransaction();

                ChatEntity chatEntity = (ChatEntity) session.load(ChatEntity.class, chatPage.getId());
                session.delete(chatEntity);
                session.getTransaction().commit();
                flag = true;
            } catch (Exception e) {
                e.printStackTrace();
                session.getTransaction().rollback();
                flag = false;
            } finally {
                HibernateUtils.closeSession(session);
            }
        }
        return flag;
    }

    public boolean Update(ChatPage chatPage) {
        boolean flag = false;
        Session session = null;
        if (isOk(chatPage)) {
            try {
                session = HibernateUtils.getSession();
                session.beginTransaction();

                ChatEntity chatEntity = (ChatEntity) session.load(ChatEntity.class, chatPage.getId());

                chatEntity.setId(chatPage.getId());
                chatEntity.setContent(chatPage.getContent());
                chatEntity.setCourseid(chatPage.getCourseid());
                chatEntity.setStatus(chatPage.getStatus());
                chatEntity.setStudentid(chatPage.getStudentid());
                chatEntity.setTime(chatPage.getTime());
                chatEntity.setTitle(chatPage.getTitle());
                session.update(chatEntity);
                session.getTransaction().commit();
                flag = true;
            } catch (Exception e) {
                e.printStackTrace();
                session.getTransaction().rollback();
                flag = false;
            } finally {
                HibernateUtils.closeSession(session);
            }
        }


        return flag;
    }

    public ChatPage GetById(String id) {
        Session session = null;
        session = HibernateUtils.getSession();
        session.beginTransaction();
        ChatPage chatPage = null;
        try {
            ChatEntity chatEntity = session.load(ChatEntity.class, id);
            chatPage = new ChatPage();

            chatPage.setId(chatEntity.getId());
            chatPage.setContent(chatEntity.getContent());
            chatPage.setCourseid(chatEntity.getCourseid());
            chatPage.setTitle(chatEntity.getTitle());
            chatPage.setStudentid(chatEntity.getStudentid());
            chatPage.setTime(chatEntity.getTime());
            chatPage.setStatus(chatEntity.getStatus());
        } catch (Exception e) {
            System.out.println("these is no chat data!");
            chatPage = null;
        }
        /*BeanUtils.copyProperties(studentEntity, studentPage);*/
        HibernateUtils.closeSession(session);
        return chatPage;
    }

    /*
返回Page类 第一个参数是column的名称，第二个参数是column具体的值
 */
    public ChatPage GetByColumn(String column, String key) {
        Session session = null;
        session = HibernateUtils.getSession();
//        String hql = "from ChatEntity where "+column+" ="+"'"+key+"'" ;
        String hql = "from ChatEntity where  " + column + " = ?";
        ArrayList<ChatEntity> chatEntities = (ArrayList<ChatEntity>) session.createQuery(hql).setParameter(0, key).list();
        ChatPage chatPage = null;
        if (chatEntities.size() > 0) {
            ChatEntity chatEntity = chatEntities.get(0);
            chatPage = new ChatPage();
            chatPage.setId(chatEntity.getId());
            chatPage.setContent(chatEntity.getContent());
            chatPage.setCourseid(chatEntity.getCourseid());
            chatPage.setTitle(chatEntity.getTitle());
            chatPage.setStudentid(chatEntity.getStudentid());
            chatPage.setTime(chatEntity.getTime());
            chatPage.setStatus(chatEntity.getStatus());

        }
        HibernateUtils.closeSession(session);
        return chatPage;

    }

    public List<ChatPage> GetAll() {
        Session session = null;
        session = HibernateUtils.getSession();
        session.beginTransaction();

        List<ChatEntity> chatEntities = session.createQuery("from ChatEntity ").list();
        List<ChatPage> chatPages = new ArrayList<>();
        if (chatEntities != null && chatEntities.size() > 0) {
            for (ChatEntity chatEntity : chatEntities) {
                ChatPage chatPage = new ChatPage();

                chatPage.setId(chatEntity.getId());
                chatPage.setContent(chatEntity.getContent());
                chatPage.setCourseid(chatEntity.getCourseid());
                chatPage.setTitle(chatEntity.getTitle());
                chatPage.setStudentid(chatEntity.getStudentid());
                chatPage.setTime(chatEntity.getTime());
                chatPage.setStatus(chatEntity.getStatus());

                /*BeanUtils.copyProperties(studentEntity, studentPage);*/
                chatPages.add(chatPage);
            }
        }
        HibernateUtils.closeSession(session);
        return chatPages;
    }
/*
返回Page类 第一个参数是column的名称，第二个参数是column具体的值
 */

    public List<ChatPage> GetAllByColumn(String column, String key) {
        Session session = HibernateUtils.getSession();
        List<ChatPage> chatPages = new ArrayList<>();
        String hql = "from ChatEntity where " + column + " = " + "'" + key + "'";
        try {
            List<ChatEntity> chatEntities = session.createQuery(hql).list();
            if (chatEntities != null && chatEntities.size() > 0) {
                for (ChatEntity chatEntity : chatEntities) {
                    ChatPage chatPage = new ChatPage();
                    chatPage.setId(chatEntity.getId());
                    chatPage.setContent(chatEntity.getContent());
                    chatPage.setCourseid(chatEntity.getCourseid());
                    chatPage.setTitle(chatEntity.getTitle());
                    chatPage.setStudentid(chatEntity.getStudentid());
                    chatPage.setTime(chatEntity.getTime());
                    chatPage.setStatus(chatEntity.getStatus());

                    /*BeanUtils.copyProperties(studentEntity, studentPage);*/
                    chatPages.add(chatPage);
                }
            }

        } catch (Exception e) {

        }
        HibernateUtils.closeSession(session);

        return chatPages;
    }

    /*
    返回List<Page>类（上面方法的重载） 第一个参数是column的名称，第二个参数是column具体的值
     */
    public List<ChatPage> GetAllByColumn(String column1, String key1, String column2, String key2) {
        Session session = HibernateUtils.getSession();
        String hql = "from ChatEntity where " + column1 + "= ? and " + column2 + "= ?";
        List<ChatEntity> chatEntities = session.createQuery(hql).setParameter(0, key1).setParameter(1, key2).list();
        List<ChatPage> chatPages = new ArrayList<>();
        try {
            if (chatEntities != null && chatEntities.size() > 0) {

                for (ChatEntity chatEntity : chatEntities) {
                    ChatPage chatPage = new ChatPage();
                    chatPage.setId(chatEntity.getId());
                    chatPage.setContent(chatEntity.getContent());
                    chatPage.setCourseid(chatEntity.getCourseid());
                    chatPage.setTitle(chatEntity.getTitle());
                    chatPage.setStudentid(chatEntity.getStudentid());
                    chatPage.setTime(chatEntity.getTime());
                    chatPage.setStatus(chatEntity.getStatus());
                    /*BeanUtils.copyProperties(studentEntity, studentPage);*/
                    chatPages.add(chatPage);
                }
            }
        } catch (Exception e) {

        }
        HibernateUtils.closeSession(session);
        return chatPages;
    }
}
