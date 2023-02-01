Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882BE686888
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  1 Feb 2023 15:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A182210E408;
	Wed,  1 Feb 2023 14:41:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812DF10E3FE;
 Wed,  1 Feb 2023 14:41:23 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311ELMCC012947; Wed, 1 Feb 2023 14:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Pghwgw7p54xgyN9qvh8HSRlvihxDFi0FYDGjkwN9hfQ=;
 b=KB+5oFs7D3P74ddhr0ubhPjwvgMwPNg0zmRJ/qQv81hNu8xJnBvcDZx47tDr0KeOXuIN
 7unHMwuYhGXgzAAUT+nGwXn5FPg3nd+YcRW0wItD1M7Squ4JHUmnE/P67mbAl3lxZ1Un
 JDNc601NmU7ChhDq7btkIvuw2Q/Wel5u4fUmom/PeiM8ojxs4YORjAz9GgDCWTHDZtly
 t5UpcNpWra2Z1pqyuVsrvPreZya0n2Mygg0mX/fWDr7PsgBNOxnI1BvhIqjjmg5DYGwS
 VIvLlW7kI2B1O6OmgSnb5Uypg+JoscDJlsLDinr4mTV9xOPjB5XmQc7sBgXwm2R62rBm pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfss7gk1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:41:22 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311EMqpS017781;
 Wed, 1 Feb 2023 14:41:21 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfss7gk17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:41:21 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311DBe48019159;
 Wed, 1 Feb 2023 14:41:20 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3ncvuqunpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:41:20 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311EfI587340750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 14:41:18 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 733895805E;
 Wed,  1 Feb 2023 14:41:18 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09FDC58052;
 Wed,  1 Feb 2023 14:41:16 +0000 (GMT)
Received: from [9.65.253.123] (unknown [9.65.253.123])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 14:41:15 +0000 (GMT)
Message-ID: <7879b29d-5cf5-c9f6-cc36-fb9ce6c0d2d4@linux.ibm.com>
Date: Wed, 1 Feb 2023 09:41:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] vfio: fix deadlock between group lock and kvm lock
Content-Language: en-US
To: "Liu, Yi L" <yi.l.liu@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "jgg@nvidia.com"
 <jgg@nvidia.com>
References: <20230131200635.44227-1-mjrosato@linux.ibm.com>
 <DS0PR11MB752972035A4CE4B2319A6C45C3D19@DS0PR11MB7529.namprd11.prod.outlook.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <DS0PR11MB752972035A4CE4B2319A6C45C3D19@DS0PR11MB7529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oWB3pJerof2Dt5aM4oiHXKVIqzotBGLN
X-Proofpoint-ORIG-GUID: BtkvJrH744mvpTcVM5fLTJoJKq6hIf8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=782 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010125
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
 "david@redhat.com" <david@redhat.com>, "Christopherson, ,
 Sean" <seanjc@google.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2/1/23 7:42 AM, Liu, Yi L wrote:
>> From: Matthew Rosato <mjrosato@linux.ibm.com>
...
>> +	if (device->kvm) {
>> +		vfio_kvm_put_kvm(device);
>> +		device->put_kvm = NULL;
> 
> Can "device->put_kvm = NULL;" be part of vfio_kvm_put_kvm()?

Sure

