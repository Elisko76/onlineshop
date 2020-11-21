package com.onlineshop.controller;

import com.onlineshop.model.Product;
import com.onlineshop.service.ProductService;
import com.onlineshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class ProductController {
    @Autowired
    UserService userService;
    
    @Autowired
    ProductService productService;
    
    @GetMapping("/products")
    public String productList(Model model) {
        model.addAttribute("products",
                           productService.allProducts()
                          );
        return "products";
    }
    
    @GetMapping("/product/add")
    public String addProductPage(Model model) {
        model.addAttribute("productForm",
                           new Product()
                          );
        return "addproduct";
    }
    
    @PostMapping("/product/add")
    public String createNewProduct(@ModelAttribute("productForm") @Valid Product productForm, Model model,
                                   BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return "addproduct";
        }
        if (!productService.create(productForm)) {
            model.addAttribute("productNameError",
                               "Such Product already exist"
                              );
            return "addproduct";
        }
        return "redirect:/products";
    }
    
    @PostMapping("/product/delete/{productId}")
    public String deleteProduct(@PathVariable("productId") Long productId, Model model){
        productService.deleteProduct(productId);
        return "redirect:/products";
    }
}
