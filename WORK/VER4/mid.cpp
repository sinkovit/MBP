}

double poly_3b_v2x::eval(const double *a, const double *x, double *t, double *g) {
#ifdef DEBUG
    std::cerr << std::scientific << std::setprecision(20);
    std::cerr << "\nEntering " << __func__ << " in " << __FILE__ << std::endl;
#endif
    f1(x, a, t);

