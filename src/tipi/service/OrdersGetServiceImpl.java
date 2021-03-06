package tipi.service;

/**
 * @author Lauri Soivi, Joona Viertola, Samuel Kontiomaa
 * @version 1.0
 * @since 18.12.2013
 * Service sends gets orders from dao, updates orders and parses dates and times.
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import tipi.bean.OrderForm;
import tipi.bean.OrdersCount;
import tipi.bean.OrdersCountImpl;
import tipi.bean.UserCompany;
import tipi.bean.UserCompanyImpl;
import tipi.bean.UserProfile;
import tipi.bean.UserProfileImpl;
import tipi.dao.OrdersDAO;
import tipi.dao.UserDAO;

@Service
public class OrdersGetServiceImpl implements OrdersGetService {

	@Inject
	private OrdersDAO ordersDAO;

	public OrdersDAO getOrdersDAO() {
		return ordersDAO;
	}

	public void setOrderDAO(OrdersDAO ordersDAO) {
		this.ordersDAO = ordersDAO;
	}
	
	@Inject
	private UserDAO userDao;
	
	public UserDAO getUserDao() {
		return userDao;
	}
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	/**
	 * Method gets one order to admin and all information to that order: user and company. Method sends object so dates
	 * and times will be parsed.
	 */
	@Override
	public OrderForm getOrderFromDAO(int id) {
		OrderForm order = ordersDAO.getOrderBean(id);
		order = parseMySQLToJavaDate(order);
		order = parseMySQLToJavaTime(order);
		order = parseMySQLToJavaTimeStamp(order);
		UserProfile userProfile = new UserProfileImpl();
		userProfile = userDao.getUsersInformationWithIdDAO(order.getUserMadeOrder(), userProfile);
		UserCompany userCompany = new UserCompanyImpl();
		userCompany = userDao.getRegisteredUsersCompanyInformationDAO(userProfile.getMyCompany(), userCompany);
		userProfile.setCompany(userCompany);
		order.setUserProfile(userProfile);
		
		return order;
	}

	/**
	 * Method gets orders by status and all information to those orders: users and companies. Method sends objects so dates
	 * and times will be parsed.
	 */
	@Override
	public List<OrderForm> getOrderListFromDAO(int statusOfOrder) {
		List<OrderForm> allOrders = ordersDAO.getOrderList(statusOfOrder);
		for (OrderForm order : allOrders) {
			order = parseMySQLToJavaDate(order);
			order = parseMySQLToJavaTime(order);
			order = parseMySQLToJavaTimeStamp(order);
			UserProfile userProfile = new UserProfileImpl();
			userProfile = userDao.getUsersInformationWithIdDAO(order.getUserMadeOrder(), userProfile);
			UserCompany userCompany = new UserCompanyImpl();
			userCompany = userDao.getRegisteredUsersCompanyInformationDAO(userProfile.getMyCompany(), userCompany);
			userProfile.setCompany(userCompany);
			order.setUserProfile(userProfile);
		}
		return allOrders;
	}
	
	/**
	 * Method sends order id and status to DAO. So DAO can change status of order
	 */
	@Override
	public void updateOrderStatus(int orders_id, int statusOfOrder) {
		ordersDAO.updateOrderStatusDAO(orders_id, statusOfOrder);
	}

	/**
	 * Method parses date yyyy-MM-dd to dd-MM-yyyy
	 */
	@Override
	public OrderForm parseMySQLToJavaDate(OrderForm order) {
		SimpleDateFormat oldFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat newFormat = new SimpleDateFormat("dd.MM.yyyy");

		try {
			order.setCollectionDate(newFormat.format(oldFormat.parse(order
					.getCollectionDate())));
			order.setDestinationDate(newFormat.format(oldFormat.parse(order
					.getDestinationDate())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (order.getNextDestinationCollectionDate() != null) {
			try {
				order.setNextDestinationCollectionDate(newFormat
						.format(oldFormat.parse(order
								.getNextDestinationCollectionDate())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (order.getNextDestinationDate() != null) {
			try {
				order.setNextDestinationDate(newFormat.format(oldFormat
						.parse(order.getNextDestinationDate())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return order;
	}
	
	/**
	 * Method parses time HH:mm:ss to HH:mm
	 */
	@Override
	public OrderForm parseMySQLToJavaTime(OrderForm order) {
		SimpleDateFormat oldFormat = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat newFormat = new SimpleDateFormat("HH:mm");

		try {
			order.setCollectionTime(newFormat.format(oldFormat.parse(order
					.getCollectionTime())));
			order.setDestinationTime(newFormat.format(oldFormat.parse(order
					.getDestinationTime())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (order.getNextDestinationCollectionTime() != null) {
			try {
				order.setNextDestinationCollectionTime(newFormat
						.format(oldFormat.parse(order
								.getNextDestinationCollectionTime())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (order.getNextDestinationTime() != null) {
			try {
				order.setNextDestinationTime(newFormat.format(oldFormat
						.parse(order.getNextDestinationTime())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return order;
	}
	
	/**
	 * Method parses timestamp yyyy-MM-dd HH:mm:ss.S to dd.MM.yyyy HH:mm
	 */
	@Override
	public OrderForm parseMySQLToJavaTimeStamp(OrderForm order) {
		SimpleDateFormat oldFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		SimpleDateFormat newFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm");

		try {
			order.setLastTimeEdited(newFormat.format(oldFormat.parse(order
					.getLastTimeEdited())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return order;
	}
	
	/**
	 * Method sends criteria to DAO what orders users wants to see in his/hers orders.
	 */
	@Override
	public List<OrderForm> getOrderListForUserFromDAO(int user_id, int hasNewDestination, int companyMadeOrder, int statusOfOrder) {
		List<OrderForm> orderList = ordersDAO.getOrderListForUser(user_id, hasNewDestination, companyMadeOrder, statusOfOrder);
		for (OrderForm order : orderList) {
			order = parseMySQLToJavaTimeStamp(order);
		}
		return orderList;
	}
	
	/**
	 * Method gets orders information to user
	 */
	@Override
	public OrderForm getOrderForUserFromDAO(int id) {
		OrderForm order = ordersDAO.getOrderBean(id);
		order = parseMySQLToJavaDate(order);
		order = parseMySQLToJavaTime(order);
		order = parseMySQLToJavaTimeStamp(order);
		UserProfile userProfile = new UserProfileImpl();
		userProfile = userDao.getUsersInformationWithIdDAO(order.getUserMadeOrder(), userProfile);
		UserCompany userCompany = new UserCompanyImpl();
		userCompany = userDao.getRegisteredUsersCompanyInformationDAO(userProfile.getMyCompany(), userCompany);
		userProfile.setCompany(userCompany);
		order.setUserProfile(userProfile);
		return order;
	}
	
	/**
	 * Method gets count for orders new,accepted,taken,completed
	 */
	@Override
	public OrdersCount getOrdersCount() {
		OrdersCount ordersCount = new OrdersCountImpl();
		ordersCount = ordersDAO.ordersCountDAO(ordersCount);
		return ordersCount;
	}
	
	/**
	 * Method sends criteria to DAO what orders admin wants to see in his/hers search orders.
	 */
	@Override
	public List<OrderForm> searchOrdersService(OrderForm searchOrders) {

		List<OrderForm> orders = ordersDAO.searchOrdersFromDAO(searchOrders);
		for (OrderForm order : orders) {
			order = parseMySQLToJavaDate(order);
			order = parseMySQLToJavaTime(order);
			order = parseMySQLToJavaTimeStamp(order);
			UserProfile userProfile = new UserProfileImpl();
			userProfile = userDao.getUsersInformationWithIdDAO(order.getUserMadeOrder(), userProfile);
			UserCompany userCompany = new UserCompanyImpl();
			userCompany = userDao.getRegisteredUsersCompanyInformationDAO(userProfile.getMyCompany(), userCompany);
			userProfile.setCompany(userCompany);
			order.setUserProfile(userProfile);
		}
		return orders;
	}
}