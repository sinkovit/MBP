}

double poly_3b_v2x::eval(const double *a, const double *x, double *t, double *g) {
#ifdef DEBUG
    std::cerr << std::scientific << std::setprecision(20);
    std::cerr << "\nEntering " << __func__ << " in " << __FILE__ << std::endl;
#endif
    f1(x, a, t);

    g[0] = t[4522];
    g[1] = t[6963];
    g[2] = t[11746];
    g[3] = t[13945] + t[13948];
    g[4] = t[13951] + t[13954];
    g[5] = t[13957] + t[13960];
    g[6] = t[13963] + t[13966];
    g[7] = t[13969] + t[13972];
    g[8] = t[13975] + t[13978];
    g[9] = t[13991] + t[14018];
    g[10] = t[14053] + t[14059];
    g[11] = t[14114] + t[14141];
    g[12] = t[14161] + t[14209];
    g[13] = t[14246] + t[14297];
    g[14] = t[14318] + t[14368];
    g[15] = t[14436] + t[14476];
    g[16] = t[14507] + t[14556];
    g[17] = t[14606] + t[14664];
    g[18] = t[14711] + t[14761];
    g[19] = t[14822] + t[14857];
    g[20] = t[14905] + t[14952];
    g[21] = t[15198] + t[15487];
    g[22] = t[15714] + t[15979];
    g[23] = t[16220] + t[16700];
    g[24] = t[16909] + t[17264];
    g[25] = t[17873] + t[18364];
    g[26] = t[18846] + t[19131];
    g[27] = t[19728] + t[20486];
    g[28] = t[20959] + t[21475];
    g[29] = t[22132] + t[22778];
    g[30] = t[23404] + t[23926];
    g[31] = t[24477] + t[25295];
    g[32] = t[25792] + t[26393];
    g[33] = t[27713] + t[28802];
    g[34] = t[30251] + t[30876];
    g[35] = t[31746] + t[32608];
    double e = t[9982] + t[13942];

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
