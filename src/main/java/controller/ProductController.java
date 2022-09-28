package controller;

import model.Product;
import service.IProductService;
import service.ProductServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(value ={"/", "/Products"} )
public class ProductController extends HttpServlet {

    private IProductService productService = new ProductServiceIMPL();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreat(request, response);
                break;
                case "edit":
                    showFormEdit(request, response);
                    break;
            default:
                showListProduct(request, response);
        }
        showListProduct(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                actionCreat(request, response);
                break;
        }

    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("listProduct", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/index.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormCreat(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void actionCreat(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = productService.findAll().get(productService.findAll().size() -1).getId()+1;
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        Product product = new Product(id, name, price, description);
        productService.save(product);
        request.setAttribute("message", "Product created successfully");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request, response);


    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("productEdit", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        dispatcher.forward(request, response);
    }

}
