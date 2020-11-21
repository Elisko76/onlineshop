package com.onlineshop.service;

import com.onlineshop.model.Product;
import com.onlineshop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    ProductRepository productRepository;
    
    public List<Product> allProducts() {
        return productRepository.findAll();
    }
    
    public boolean create(Product product) {
        Product productFromDB = productRepository.findByName(product.getName());
        if (productFromDB != null) {
            return false;
        }
        product.setName(product.getName());
        product.setDescription(product.getDescription());
        product.setCathegory(product.getCathegory());
        product.setPrice(product.getPrice());
        product.setPhoto(product.getPhoto());
        productRepository.save(product);
        return true;
    }
    
    public boolean deleteProduct(final Long productId) {
        if (productRepository.findById(productId).isPresent()) {
            productRepository.deleteById(productId);
            return true;
        }
        return false;
    }
}
