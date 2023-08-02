struct Point {
    int x;
    int y;
};

// cin >> point;
std::istream& operator>>(std::istream& is, Point& point) {
    is >> point.x >> point.y;
    return is;
}

// cout << point;
std::ostream& operator<<(std::ostream& os, const Point& point) {
    os << point.x << " " << point.y;
    return os;
}

// point < point
bool operator<(const Point& left, const Point& right) {
    const int leftsum = left.x + left.y;
    const int rightsum = right.x + right.y;

    if (leftsum == rightsum) {
        return left.x < right.x;
    }

    return leftsum < rightsum;
}

// point > point
bool operator>(const Point& left, const Point& right) {
    const int leftsum = left.x + left.y;
    const int rightsum = right.x + right.y;

    if (leftsum == rightsum) {
        return left.x > right.x;
    }

    return leftsum > rightsum;
}

// point == point
bool operator==(const Point& left, const Point& right) {
    return (left.x == right.x) && (left.y == right.y);
}

// point <= point
bool operator<=(const Point& left, const Point& right) {
    return (left < right) || (left == right);
}

// point >= point
bool operator>=(const Point& left, const Point& right) {
    return (left > right) || (left == right);
}

// point != point
bool operator!=(const Point& left, const Point& right) {
    return !(left == right);
}
