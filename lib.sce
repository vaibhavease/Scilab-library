function b = slib_base()
    b = "https://raw.githubusercontent.com/vaibhavease/Scilab-library/main/";
endfunction

function slib_get(url, dest)
    if isdef("http_get") then
        [r, status] = http_get(url, dest, follow = %t);
        if status <> 200 then
            error("Download failed (HTTP " + string(status) + "). Check internet or practical number.");
        end
    else
        getURL(url, dest);
    end
    if ~isfile(dest) then
        error("Download failed. Check internet connection.");
    end
endfunction

function p = slib_fetch(n)
    if type(n) <> 1 then
        error("Practical number must be a number, e.g. run_practical(1)");
    end
    if size(n, "*") <> 1 | n <> round(n) | n < 1 | n > 99 then
        error("Practical number must be a whole number from 1 to 99.");
    end
    p = TMPDIR + "/practical" + string(n) + ".sci";
    slib_get(slib_base() + "practical" + string(n) + ".sci", p);
endfunction

function list_practicals()
    f = TMPDIR + "/list.txt";
    slib_get(slib_base() + "list.txt", f);
    mprintf("%s\n", mgetl(f));
endfunction

function load_practical(n)
    p = slib_fetch(n);
    mprintf("%s\n", mgetl(p));
endfunction

function run_practical(n)
    p = slib_fetch(n);
    exec(p, -1);
endfunction
