package com.onlineshop.service;

import com.onlineshop.model.Product;
import com.onlineshop.model.Role;
import com.onlineshop.model.User;
import com.onlineshop.model.UserRoles;
import com.onlineshop.repository.ProductRepository;
import com.onlineshop.repository.RoleRepository;
import com.onlineshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class UserService
      implements UserDetailsService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    ProductRepository productRepository;


    public boolean save(User userFromRegistration) {
        User userFromDB = userRepository.findByUsername(userFromRegistration.getUsername());
        if (userFromDB != null) {
            return false;
        }
        userFromRegistration.setPassword(bCryptPasswordEncoder.encode(userFromRegistration.getPassword()));
        userFromRegistration.setEmail(userFromRegistration.getEmail());
        userFromRegistration.setFirstName(userFromRegistration.getFirstName());
        userFromRegistration.setLastName(userFromRegistration.getLastName());
        userFromRegistration.setSecondName(userFromRegistration.getSecondName());
        userFromRegistration.setAddress(userFromRegistration.getAddress());
        userFromRegistration.setPhoneNumber(userFromRegistration.getPhoneNumber());
        userFromRegistration.setRoles(Collections.singleton(new Role(1L,
                                                                     UserRoles.USER_ROLE
        )));
        userRepository.save(userFromRegistration);
        return true;
    }
    
    
    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }
    

    public List<User> allUsers() {
        return userRepository.findAll();
    }
    
    
    public boolean deleteUser(final Long userId) {
        if (userRepository.findById(userId).isPresent()) {
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    //ПАДАЕТ :С
    public boolean addProductToBasket(String username, Long productId) {
        User userInDb = userRepository.findByUsername(username);
        Product product = productRepository.findById(productId).get();
        userInDb.setProducts(Collections.singleton(product));
        userRepository.save(userInDb);
        return true;
    }
    
}
