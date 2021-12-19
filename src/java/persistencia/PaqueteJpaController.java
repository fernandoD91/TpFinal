/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.ServicioTuristico;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import logica.Paquete;
import persistencia.exceptions.NonexistentEntityException;
import javax.persistence.Persistence;

/**
 *
 * @author DanielFernandoPosta
 */
public class PaqueteJpaController implements Serializable {

    public PaqueteJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public PaqueteJpaController() {
        emf = Persistence.createEntityManagerFactory("TpFinalPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Paquete paquete) {
        if (paquete.getListaServicioTuristico() == null) {
            paquete.setListaServicioTuristico(new ArrayList<ServicioTuristico>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<ServicioTuristico> attachedListaServicioTuristico = new ArrayList<ServicioTuristico>();
            for (ServicioTuristico listaServicioTuristicoServicioTuristicoToAttach : paquete.getListaServicioTuristico()) {
                listaServicioTuristicoServicioTuristicoToAttach = em.getReference(listaServicioTuristicoServicioTuristicoToAttach.getClass(), listaServicioTuristicoServicioTuristicoToAttach.getCodigo_servicio());
                attachedListaServicioTuristico.add(listaServicioTuristicoServicioTuristicoToAttach);
            }
            paquete.setListaServicioTuristico(attachedListaServicioTuristico);
            em.persist(paquete);
            for (ServicioTuristico listaServicioTuristicoServicioTuristico : paquete.getListaServicioTuristico()) {
                listaServicioTuristicoServicioTuristico.getListaPaquete().add(paquete);
                listaServicioTuristicoServicioTuristico = em.merge(listaServicioTuristicoServicioTuristico);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Paquete paquete) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Paquete persistentPaquete = em.find(Paquete.class, paquete.getCodigoPaquete());
            List<ServicioTuristico> listaServicioTuristicoOld = persistentPaquete.getListaServicioTuristico();
            List<ServicioTuristico> listaServicioTuristicoNew = paquete.getListaServicioTuristico();
            List<ServicioTuristico> attachedListaServicioTuristicoNew = new ArrayList<ServicioTuristico>();
            for (ServicioTuristico listaServicioTuristicoNewServicioTuristicoToAttach : listaServicioTuristicoNew) {
                listaServicioTuristicoNewServicioTuristicoToAttach = em.getReference(listaServicioTuristicoNewServicioTuristicoToAttach.getClass(), listaServicioTuristicoNewServicioTuristicoToAttach.getCodigo_servicio());
                attachedListaServicioTuristicoNew.add(listaServicioTuristicoNewServicioTuristicoToAttach);
            }
            listaServicioTuristicoNew = attachedListaServicioTuristicoNew;
            paquete.setListaServicioTuristico(listaServicioTuristicoNew);
            paquete = em.merge(paquete);
            for (ServicioTuristico listaServicioTuristicoOldServicioTuristico : listaServicioTuristicoOld) {
                if (!listaServicioTuristicoNew.contains(listaServicioTuristicoOldServicioTuristico)) {
                    listaServicioTuristicoOldServicioTuristico.getListaPaquete().remove(paquete);
                    listaServicioTuristicoOldServicioTuristico = em.merge(listaServicioTuristicoOldServicioTuristico);
                }
            }
            for (ServicioTuristico listaServicioTuristicoNewServicioTuristico : listaServicioTuristicoNew) {
                if (!listaServicioTuristicoOld.contains(listaServicioTuristicoNewServicioTuristico)) {
                    listaServicioTuristicoNewServicioTuristico.getListaPaquete().add(paquete);
                    listaServicioTuristicoNewServicioTuristico = em.merge(listaServicioTuristicoNewServicioTuristico);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = paquete.getCodigoPaquete();
                if (findPaquete(id) == null) {
                    throw new NonexistentEntityException("The paquete with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Paquete paquete;
            try {
                paquete = em.getReference(Paquete.class, id);
                paquete.getCodigoPaquete();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The paquete with id " + id + " no longer exists.", enfe);
            }
            List<ServicioTuristico> listaServicioTuristico = paquete.getListaServicioTuristico();
            for (ServicioTuristico listaServicioTuristicoServicioTuristico : listaServicioTuristico) {
                listaServicioTuristicoServicioTuristico.getListaPaquete().remove(paquete);
                listaServicioTuristicoServicioTuristico = em.merge(listaServicioTuristicoServicioTuristico);
            }
            em.remove(paquete);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Paquete> findPaqueteEntities() {
        return findPaqueteEntities(true, -1, -1);
    }

    public List<Paquete> findPaqueteEntities(int maxResults, int firstResult) {
        return findPaqueteEntities(false, maxResults, firstResult);
    }

    private List<Paquete> findPaqueteEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Paquete.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Paquete findPaquete(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Paquete.class, id);
        } finally {
            em.close();
        }
    }

    public int getPaqueteCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Paquete> rt = cq.from(Paquete.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
