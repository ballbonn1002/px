<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="table-responsive">
<table class="table table-hover js-basic-example dataTable table-custom m-b-0">
      <thead>
          <tr>
              <th></th>
              <th>Name</th>
              <th>Employee ID</th>
              <th>Phone</th>
              <th>Join Date</th>
              <th>Role</th>
              <th>Salary</th>
              <th>Action</th>
          </tr>
      </thead>
      <tbody>
          <tr>
              <td class="width45">
                  <img src="/pages-back/assets/images/xs/avatar2.jpg" class="rounded-circle width35" alt="">
              </td>
              <td>
                  <h6 class="mb-0">Susie Willis</h6>
                  <span>sussie-w@gmail.com</span>
              </td>
              <td><span>LA-0216</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>28 Jun, 2015</td>
              <td>Web Developer</td>
              <td>$589</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar3.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Debra Stewart</h6>
                  <span>debra@gmail.com</span>
              </td>
              <td><span>LA-0218</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>21 July, 2015</td>
              <td>Web Developer</td>
              <td>$589</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar4.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Francisco Vasquez</h6>
                  <span>francis-v@gmail.com</span>
              </td>
              <td><span>LA-0222</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>18 Jan, 2016</td>
              <td>Team Leader</td>
              <td>$589</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar5.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Jane Hunt</h6>
                  <span>jane-hunt@gmail.com</span>
              </td>
              <td><span>LA-0232</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>08 Mar, 2016</td>
              <td>Android Developer</td>
              <td>$589</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar6.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Darryl Day</h6>
                  <span>darryl.day@gmail.com</span>
              </td>
              <td><span>LA-0233</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>13 Nov, 2016</td>
              <td>IOS Developer</td>
              <td>$700</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar1.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Marshall Nichols</h6>
                  <span>marshall-n@gmail.com</span>
              </td>
              <td><span>LA-0215</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>24 Jun, 2015</td>
              <td>Web Designer</td>
              <td>$700</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar2.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Susie Willis</h6>
                  <span>sussie-w@gmail.com</span>
              </td>
              <td><span>LA-0216</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>28 Jun, 2015</td>
              <td>Web Developer</td>
              <td>$650</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar3.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Debra Stewart</h6>
                  <span>debra@gmail.com</span>
              </td>
              <td><span>LA-0218</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>21 July, 2015</td>
              <td>Web Developer</td>
              <td>$700</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar4.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Francisco Vasquez</h6>
                  <span>francis-v@gmail.com</span>
              </td>
              <td><span>LA-0222</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>18 Jan, 2016</td>
              <td>Team Leader</td>
              <td>$750</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar5.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Jane Hunt</h6>
                  <span>jane-hunt@gmail.com</span>
              </td>
              <td><span>LA-0232</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>08 Mar, 2016</td>
              <td>Android Developer</td>
              <td>$700</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
          <tr>
              <td><img src="/pages-back/assets/images/xs/avatar6.jpg" class="rounded-circle width35" alt=""></td>
              <td>
                  <h6 class="mb-0">Darryl Day</h6>
                  <span>darryl.day@gmail.com</span>
              </td>
              <td><span>LA-0233</span></td>
              <td><span>+ 264-625-2583</span></td>
              <td>13 Nov, 2016</td>
              <td>IOS Developer</td>
              <td>$750</td>
              <td>
                  <button type="button" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="send salary slip"><i class="fa fa-envelope-o"></i> Slip</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" title="Edit"><i class="fa fa-edit"></i></button>
                  <button type="button" class="btn btn-sm btn-outline-danger js-sweetalert" title="Delete" data-type="confirm"><i class="fa fa-trash-o"></i></button>
              </td>
          </tr>
      </tbody>
    </table>
</div>