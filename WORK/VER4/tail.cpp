
#ifdef DEBUG
    std::cerr << std::scientific << std::setprecision(20);
    std::cerr << "\nExiting " << __func__ << " in " << __FILE__ << std::endl;
    std::cerr << "Input linear constants (a):\n";
    for (size_t j = 0; j < 1163; j++) {
        std::cerr << a[j] << " , ";
    }
    std::cerr << std::endl;
    std::cerr << "Input polynomial variables (x):\n";
    for (size_t j = 0; j < 36; j++) {
        std::cerr << x[j] << " , ";
    }
    std::cerr << std::endl;
    std::cerr << "Output polynomial gradients (g):\n";
    for (size_t j = 0; j < 36; j++) {
        std::cerr << g[j] << " , ";
    }
    std::cerr << std::endl;
    std::cerr << "Output polynomial energy: " << e << std::endl;
#endif

    return e;
}

}  // namespace x2o
